using LaravelAdminMysql.Forms;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace LaravelAdminMysql
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        sql3238345Entities context = new sql3238345Entities();
        CollectionViewSource userViewSource;
        CollectionViewSource userContactViewSource;
        CollectionViewSource projectViewSource;
        CollectionViewSource projectTaskViewSource;
        CollectionViewSource roleViewSource;
        CollectionViewSource roleUserViewSource;
        public MainWindow()
        {
            context.users.Load();
            InitializeComponent();
            userViewSource = ((CollectionViewSource)
                (FindResource("userViewSource")));
            projectViewSource = ((CollectionViewSource)
                (FindResource("projectViewSource")));
            roleViewSource = ((CollectionViewSource)
                (FindResource("roleViewSource")));
            userContactViewSource = ((CollectionViewSource)
                (FindResource("usercontactsViewSource")));
            projectTaskViewSource = ((CollectionViewSource)
                (FindResource("projecttasksViewSource")));
            roleUserViewSource = ((CollectionViewSource)
                (FindResource("roleusersViewSource")));

            DataContext = this;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {   
            Task task1 = new Task(() => LoadDataFromDatabase());
            task1.Start();
            TabControlWithData.SelectedIndex = 0;
        }

        private void LoadDataFromDatabase()
        {
          
            Dispatcher.Invoke(() => userViewSource.Source = context.users.Local);
            context.projects.Load();
            Dispatcher.Invoke(() => projectViewSource.Source = context.projects.Local);
            context.roles.Load();
            Dispatcher.Invoke(() => roleViewSource.Source = context.roles.Local);
            


        }

        private void ButtonLogin_Click(object sender, RoutedEventArgs e)
        {
            if(TextBoxEmailLogin.Text!= String.Empty && TextBoxPasswordLogin.Password != String.Empty)
            {
                user user = (from users in context.users.Local
                            where users.email == TextBoxEmailLogin.Text
                            select users).FirstOrDefault();
                if (user != null)                  
                {
                    bool comparePassword = false;
                    try
                    {
                         comparePassword = BCrypt.Net.BCrypt.Verify(TextBoxPasswordLogin.Password, user.password);
                    }
                    catch(Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                    if (comparePassword)
                    {
                        var role = user.roles.Any(x => x.name == "Admin");
                        if (role)
                        {
                            MessageBox.Show(String.Format("Добрый день, {0}! Сейчас загрузим данные", user.name));
                            StackPanelFormLogin.Visibility = Visibility.Hidden;
                            TabControlWithData.Visibility = Visibility.Visible;
                        }
                        else
                        {
                            MessageBox.Show(String.Format("Добрый день, {0}! Чтобы просматривать данные у вас должны быть права админа. Обратитесь к администратору.", user.name));
                        }
                    }
                    else
                    {
                        MessageBox.Show("Login or Password does not correct, try again...");
                    }
                }
               else
                {
                    MessageBox.Show("Login or Password does not correct, try again...");
                }
            }
            else
            {
                MessageBox.Show("Enter login and password!");
            }
        }


        #region Navigation on the parents grids
        private void FirstCommandHandler(object sender, ExecutedRoutedEventArgs e)
        {
            FrameworkElement parent = (FrameworkElement)((Button)e.Source).Parent;
            string parent_name = parent.Name;
            switch (parent_name)
            {
                case "NavigationUsers":
                    userViewSource.View.MoveCurrentToFirst();
                    break;
                case "NavigationProjects":
                    projectViewSource.View.MoveCurrentToFirst();
                    break;
                case "NavigationRoles":
                    roleViewSource.View.MoveCurrentToFirst();
                    break;
                default:
                    break;
            }

        }

        private void LastCommandHandler(object sender, ExecutedRoutedEventArgs e)
        {
            FrameworkElement parent = (FrameworkElement)((Button)e.Source).Parent;
            string parent_name = parent.Name;
            switch (parent_name)
            {
                case "NavigationUsers":
                    userViewSource.View.MoveCurrentToLast();
                    break;
                case "NavigationProjects":
                    projectViewSource.View.MoveCurrentToLast();
                    break;
                case "NavigationRoles":
                    roleViewSource.View.MoveCurrentToLast();
                    break;
                default:
                    break;
            }
        }

        private void NextCommandHandler(object sender, ExecutedRoutedEventArgs e)
        {
            FrameworkElement parent = (FrameworkElement)((Button)e.Source).Parent;
            string parent_name = parent.Name;
            switch (parent_name)
            {
                case "NavigationUsers":
                    userViewSource.View.MoveCurrentToNext();
                    break;
                case "NavigationProjects":
                    projectViewSource.View.MoveCurrentToNext();
                    break;
                case "NavigationRoles":
                    roleViewSource.View.MoveCurrentToNext();
                    break;
                default:
                    break;
            }
        }

        private void PreviousCommandHandler(object sender, ExecutedRoutedEventArgs e)
        {
            FrameworkElement parent = (FrameworkElement)((Button)e.Source).Parent;
            string parent_name = parent.Name;
            switch (parent_name)
            {
                case "NavigationUsers":
                    userViewSource.View.MoveCurrentToPrevious();
                    break;
                case "NavigationProjects":
                    projectViewSource.View.MoveCurrentToPrevious();
                    break;
                case "NavigationRoles":
                    roleViewSource.View.MoveCurrentToPrevious();
                    break;
                default:
                    break;
            }
        }
        #endregion

        #region User (Create, Delete, Update)
        private void btnNewUser_Click(object sender, RoutedEventArgs e)
        {
            FormUser form = new FormUser(context);

            form.ShowDialog();
            userViewSource.View.Refresh();
        }
        private void btnDeleteUser_Click(object sender, RoutedEventArgs e)
        {
            var user = userViewSource.View.CurrentItem as user;

            var userForDelete = (from c in context.users
                        where c.id == user.id
                        select c).FirstOrDefault();

            if (userForDelete != null)
            {
                //foreach (var ord in userForDelete.ORDERS.ToList())
                //{
                //    Delete_Order(ord);
                //}
                context.users.Remove(userForDelete);
            }
            context.SaveChanges();
            userViewSource.View.Refresh();
        }
        private void btnUpdateUser_Click(object sender, RoutedEventArgs e)
        {
            user user = userViewSource.View.CurrentItem as user;
            FormUser form = new FormUser(user, context);
            form.ShowDialog();
            userViewSource.View.Refresh();
        }
        #endregion

        #region Contact (Create, Delete, Update)
        private void btnNewContact_Click(object sender, RoutedEventArgs e)
        {
            var user = userViewSource.View.CurrentItem as user;
            if (user == null)
            {
                MessageBox.Show("No user selected.");
                return;
            }
            context.contact_types.Load();
            FormContact form = new FormContact(user, context);
            form.ShowDialog();
            userContactViewSource.View.Refresh();
        }

        private void btnDeleteContact_Click(object sender, RoutedEventArgs e)
        {
            var contact = userContactViewSource.View.CurrentItem as contact;

            var contactForDelete = (from c in context.contacts
                                 where c.id == contact.id
                                 select c).FirstOrDefault();

            if (contactForDelete != null)
            {
                //foreach (var ord in userForDelete.ORDERS.ToList())
                //{
                //    Delete_Order(ord);
                //}
                context.contacts.Remove(contactForDelete);
            }
            context.SaveChanges();
            userContactViewSource.View.Refresh();
        }

        private void btnUpdateContact_Click(object sender, RoutedEventArgs e)
        {
            var contact = userContactViewSource.View.CurrentItem as contact;
            context.contact_types.Load();
            FormContact form = new FormContact(contact, context);
            form.ShowDialog();
            userContactViewSource.View.Refresh();
        }
        #endregion

        #region Project (Create, Delete, Update)
        private void btnNewProjet_Click(object sender, RoutedEventArgs e)
        {
            FormProject form = new FormProject(context);
            form.ShowDialog();
            projectViewSource.View.Refresh();
        }
        private void btnDeleteProject_Click(object sender, RoutedEventArgs e)
        {
            var project = projectViewSource.View.CurrentItem as project;

            var projectForDelete = (from c in context.projects
                                 where c.id == project.id
                                 select c).FirstOrDefault();

            if (projectForDelete != null)
            {
                //foreach (var ord in userForDelete.ORDERS.ToList())
                //{
                //    Delete_Order(ord);
                //}
                context.projects.Remove(projectForDelete);
            }
            context.SaveChanges();
            projectViewSource.View.Refresh();
        }

        private void btnUpdateProject_Click(object sender, RoutedEventArgs e)
        {
            var project = projectViewSource.View.CurrentItem as project;
            FormProject form = new FormProject(project, context);
            form.ShowDialog();
            projectViewSource.View.Refresh();
        }
        #endregion

        #region Task (Create, Delete, Update)
        private void btnNewTask_Click(object sender, RoutedEventArgs e)
        {
            var project = projectViewSource.View.CurrentItem as project;
            if (project == null)
            {
                MessageBox.Show("No project selected.");
                return;
            }
            FormTask form = new FormTask(project, context);
            form.ShowDialog();
            projectTaskViewSource.View.Refresh();
        }
        private void btnDeleteTask_Click(object sender, RoutedEventArgs e)
        {
            var task = projectTaskViewSource.View.CurrentItem as task;
            var taskForDelete = (from c in context.tasks
                                    where c.id == task.id
                                    select c).FirstOrDefault();

            if (taskForDelete != null)
            {
                //foreach (var ord in userForDelete.ORDERS.ToList())
                //{
                //    Delete_Order(ord);
                //}
                context.tasks.Remove(taskForDelete);
            }
            context.SaveChanges();
            projectTaskViewSource.View.Refresh();

        }

        private void btnUpdateTask_Click(object sender, RoutedEventArgs e)
        {
            var task = projectTaskViewSource.View.CurrentItem as task;
            FormTask form = new FormTask(task, context);
            form.ShowDialog();
            projectTaskViewSource.View.Refresh();
        }
        #endregion

        #region Role (Create, Delete, Update)
        private void btnNewRole_Click(object sender, RoutedEventArgs e)
        {
            FormRole form = new FormRole(context);
            form.ShowDialog();
            roleViewSource.View.Refresh();
        }
        private void btnDeleteRole_Click(object sender, RoutedEventArgs e)
        {
            var role = roleViewSource.View.CurrentItem as role;
            var roleForDelete = (from c in context.roles
                                 where c.id == role.id
                                 select c).FirstOrDefault();

            if (roleForDelete != null)
            {
                //foreach (var ord in userForDelete.ORDERS.ToList())
                //{
                //    Delete_Order(ord);
                //}
                context.roles.Remove(roleForDelete);
            }
            context.SaveChanges();
            roleViewSource.View.Refresh();
        }

        private void btnUpdateRole_Click(object sender, RoutedEventArgs e)
        {
            var role = roleViewSource.View.CurrentItem as role;
            FormRole form = new FormRole(role, context);
            form.ShowDialog();
            roleViewSource.View.Refresh();
        }
        #endregion

        #region (Add User Role, delete role from user)
        private void btnAddUserRole_Click(object sender, RoutedEventArgs e)
        {
            var role = roleViewSource.View.CurrentItem as role;
            if (role == null)
            {
                MessageBox.Show("No role selected.");
                return;
            }
            FormAddUserForRole form = new FormAddUserForRole(role, context);
            form.ShowDialog();
            roleUserViewSource.View.Refresh();
        }

        private void btnDeleteThisRoleFromUser_Click(object sender, RoutedEventArgs e)
        {
            var role = roleViewSource.View.CurrentItem as role;
            if (role == null)
            {
                MessageBox.Show("No role selected.");
                return;
            }
            var user = roleUserViewSource.View.CurrentItem as user;
            user.roles.Remove(role);
            if (user.roles.Count == 0)
            {
                role roleClient = context.roles.Local.FirstOrDefault(r => r.name == "Client");
                if(roleClient != null)
                {
                    MessageBox.Show("User must have a role, the default role 'Client' will be set");
                    user.roles.Add(roleClient);
                }
                else
                {
                    MessageBox.Show("User is left without roles, he may have problems accessing the site");
                }

            }
            context.SaveChanges();
            roleUserViewSource.View.Refresh();
        }

        private void btnAddOtherRoleForThisUser_Click(object sender, RoutedEventArgs e)
        {
            var user = roleUserViewSource.View.CurrentItem as user; 
            FormAddRoleForUser form = new FormAddRoleForUser(user, context);
            form.ShowDialog();
            roleUserViewSource.View.Refresh();
        }

        #endregion

        
    }
}
