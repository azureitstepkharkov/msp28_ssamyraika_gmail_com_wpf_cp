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
    /// Interaction logic for FormRole.xaml
    /// </summary>
    public partial class FormRole : Window
    {
        private role role;
        private sql3238345Entities context;
        private bool saveTrigger = false;
        private bool update = false;

        private FormRole()
        {
            InitializeComponent();
        }

        public FormRole(sql3238345Entities context)
        {
            InitializeComponent();
            this.context = context;
            role = new role();
            this.DataContext = role;
        }

        public FormRole(role role, sql3238345Entities context)
        {
            InitializeComponent();
            this.role = role;
            this.context = context;
            this.DataContext = role;
            update = true;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }

        private void SaveUser_Click(object sender, RoutedEventArgs e)
        {
            if (!update)
            {
                roleNameTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                roleDisplay_nameTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                roleDescriptionTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                if (Validation.GetHasError(roleNameTextBox) == true)
                {
                    MessageBox.Show("Есть не верно заполненные поля, запись не сохранится");
                    this.Close();
                    return;
                }
                else
                {

                    context.roles.Local.Add(role);
                }
            }
            context.SaveChanges();
            saveTrigger = true;
            this.Close();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (!saveTrigger && update)
            {
                foreach (var entry in context.ChangeTracker
                             .Entries<role>()
                             .Where(re => re.State == EntityState.Modified))
                {
                    entry.CurrentValues.SetValues(entry.OriginalValues);
                }
                roleNameTextBox.Text = role.name;
                roleDisplay_nameTextBox.Text = role.display_name;
                roleDescriptionTextBox.Text = role.description;
            }
        }

        
    }
}
