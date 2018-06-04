using System;
using System.Collections.Generic;
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

namespace LaravelAdminMysql.Forms
{
    /// <summary>
    /// Interaction logic for FormAddUserForRole.xaml
    /// </summary>
    public partial class FormAddUserForRole : Window
    {
        private role role;
        private sql3238345Entities context;

        private FormAddUserForRole()
        {
            InitializeComponent();
        }

        public FormAddUserForRole(role role, sql3238345Entities context)
        {
            InitializeComponent();
            this.role = role;
            this.context = context;
            IList<user> allUsers = context.users.Local;
            IList<user> userForCombobox = allUsers.Except(role.users).ToList();
            if (userForCombobox.Count != 0)
            {
                userComboBox.ItemsSource = userForCombobox;
                userComboBox.SelectedIndex = 0;
            }
            else
            {
                MessageBox.Show("no user to select...");
                this.Close();
            }
        }

        private void SaveUser_Click(object sender, RoutedEventArgs e)
        {
            user SelectedUser = (user)userComboBox.SelectedItem;
            role.users.Add(SelectedUser);
            context.SaveChanges();
            MessageBox.Show("User was added");
            this.Close();
        }
    }
}
