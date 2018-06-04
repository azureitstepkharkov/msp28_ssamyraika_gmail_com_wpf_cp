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
    /// Interaction logic for FormAddRoleForUser.xaml
    /// </summary>
    public partial class FormAddRoleForUser : Window
    {
        private user user;
        private sql3238345Entities context;

        private FormAddRoleForUser()
        {
            InitializeComponent();
        }

        public FormAddRoleForUser(user user, sql3238345Entities context)
        {
            InitializeComponent();
            this.user = user;
            this.context = context;
            IList<role> allRoles = context.roles.Local;
            IList<role> RolesForCombobox = allRoles.Except(user.roles).ToList();
            if(RolesForCombobox.Count != 0)
            {
                roleComboBox.ItemsSource = RolesForCombobox;
                roleComboBox.SelectedIndex = 0;
            }
            else
            {
                MessageBox.Show("no roles to select...");
                this.Close();
            }
        }

        private void SaveUser_Click(object sender, RoutedEventArgs e)
        {
            role SelectedRole = (role)roleComboBox.SelectedItem;
            user.roles.Add(SelectedRole);
            context.SaveChanges();
            MessageBox.Show("Role was added");
            this.Close();
        }
    }
}
