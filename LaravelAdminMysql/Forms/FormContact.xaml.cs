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
    /// Interaction logic for FormContact.xaml
    /// </summary>
    public partial class FormContact : Window
    {
        private user user;
        private sql3238345Entities context;
        private contact contact;
        private bool saveTrigger = false;
        private bool update = false;

        private FormContact()
        {
            InitializeComponent();
        }

        public FormContact(user user, sql3238345Entities context)
        {
            InitializeComponent();
            this.user = user;
            this.context = context;
            contact = new contact();
            contact.user = user;
            contact.user_id = user.id;
            this.DataContext = contact;
            contact_typesComboBox.ItemsSource = context.contact_types.Local;
            contact_typesComboBox.SelectedIndex = 0;
        }

        public FormContact(contact contact, sql3238345Entities context)
        {
            InitializeComponent();
            this.contact = contact;
            this.context = context;
            this.DataContext = this.contact;
            contact_typesComboBox.ItemsSource = context.contact_types.Local;
            //contact_typesComboBox.SelectedValue = contact.type_id;
            update = true;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            
            
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            if (!update)
            {
                contactValueTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                contact_typesComboBox.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();

                //if (Validation.GetHasError(userEmailTextBox) == true ||
                //        Validation.GetHasError(userNameTextBox) == true ||
                //        Validation.GetHasError(userPasswordTextBox) == true ||
                //        userPasswordTextBox.Text != userConfirmPasswordTextBox.Text ||
                //        userPasswordTextBox.Text == String.Empty)
                if(contactValueTextBox.Text == String.Empty)
                {
                    MessageBox.Show("Есть не верно заполненные поля, запись не сохранится");
                    this.Close();
                    return;
                }
                else
                {
                    context.contacts.Local.Add(contact);
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
                             .Entries<contact>()
                             .Where(re => re.State == EntityState.Modified))
                {
                    entry.CurrentValues.SetValues(entry.OriginalValues);
                }
                contactValueTextBox.Text = contact.value;
                contact_typesComboBox.SelectedValue = contact.type_id;
            }
        }
    }
}
