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
using System.Windows.Shapes;

namespace LaravelAdminMysql
{
    /// <summary>
    /// Interaction logic for FormProject.xaml
    /// </summary>
    public partial class FormProject : Window
    {
        private sql3238345Entities context;
        private project project;
        private bool saveTrigger = false;
        private bool update = false;

        private FormProject()
        {
            InitializeComponent();
        }

        public FormProject(sql3238345Entities context)
        {
            InitializeComponent();
            this.context = context;
            project = new project();
            this.DataContext = project;
           
        }

        public FormProject(project project, sql3238345Entities context)
        {
            InitializeComponent();
            this.project = project;
            this.context = context;
            this.DataContext = project;
            update = true;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            role role = context.roles.Local.FirstOrDefault(r => r.name == "Client");
            if(role != null)
            {
                clientsNameComboBox.ItemsSource = role.users;
                if(!update)
                {
                    clientsNameComboBox.SelectedIndex = 0;
                    projectStatusComboBox.SelectedIndex = 1;
                }
            }
            List<string> statusesProject = new List<string>()
            {
                "finished", "in work", "canceled", "paused"
            };
            projectStatusComboBox.ItemsSource = statusesProject;
        }

        private void SaveUser_Click(object sender, RoutedEventArgs e)
        {
            if (!update)
            {
                ProjectDescriptionTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                ProjectNameTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                clientsNameComboBox.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
                projectStatusComboBox.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
                if (Validation.GetHasError(ProjectNameTextBox) == true || ProjectNameTextBox.Text == String.Empty||
                    clientsNameComboBox.SelectedItem == null)
                {
                    MessageBox.Show("Есть не верно заполненные поля, запись не сохранится");
                    this.Close();
                    return;
                }
                else
                {
                    
                    context.projects.Local.Add(project);
                }
            }
            context.SaveChanges();
            saveTrigger = true;
            this.Close();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            //если есть несохраненные изменения при закрытии - вернуть все оригинальные свойства
            if (!saveTrigger && update)
            {
                foreach (var entry in context.ChangeTracker
                             .Entries<project>()
                             .Where(re => re.State == EntityState.Modified))
                {
                    entry.CurrentValues.SetValues(entry.OriginalValues);
                }
                ProjectDescriptionTextBox.Text = project.description;
                ProjectNameTextBox.Text = project.name;
                ClientIdTextBlock.Text = project.clients_id.ToString();
                projectStatusComboBox.SelectedItem = project.status;
            }
        }
    }
}
