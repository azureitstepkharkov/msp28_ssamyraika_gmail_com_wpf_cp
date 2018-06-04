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
    /// Interaction logic for FormTask.xaml
    /// </summary>
    public partial class FormTask : Window
    {
        private project project;
        private sql3238345Entities context;
        private task task;
        private bool saveTrigger = false;
        private bool update = false;

        private FormTask()
        {
            InitializeComponent();
        }

        public FormTask(project project, sql3238345Entities context)
        {
            InitializeComponent();
            this.project = project;
            this.context = context;
            task = new task();
            task.project_id = project.id;
            this.DataContext = task;
           

        }

        public FormTask(task task, sql3238345Entities context)
        {
            InitializeComponent();
            this.task = task;
            this.context = context;
            this.DataContext = task;
            update = true;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            projectNameComboBox.ItemsSource = context.projects.Local;
            List<string> statusesTask = new List<string>()
            {
                "new","in_progress","completed","canceled"
            };
            taskStatusComboBox.ItemsSource = statusesTask;
            if(!update)
            {
                taskStatusComboBox.SelectedIndex = 0;
                taskEndDatePicker.SelectedDate = DateTime.Now;
                taskStartDatePicker.SelectedDate = DateTime.Now;
            }
        }

        private void SaveUser_Click(object sender, RoutedEventArgs e)
        {
            if (!update)
            {
                taskNameTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                taskDescriptionTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                projectNameComboBox.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
                taskStartDatePicker.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
                taskEndDatePicker.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
                taskStatusComboBox.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
                if (Validation.GetHasError(taskNameTextBox) == true ||
                    taskNameTextBox.Text == String.Empty ||
                    taskStartDatePicker.SelectedDate == null ||
                    taskEndDatePicker.SelectedDate == null 
                    )
                {
                    MessageBox.Show("Есть не верно заполненные поля, запись не сохранится");
                    this.Close();
                    return;
                }
                else
                {

                    context.tasks.Local.Add(task);
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
                             .Entries<task>()
                             .Where(re => re.State == EntityState.Modified))
                {
                    entry.CurrentValues.SetValues(entry.OriginalValues);
                }
                taskNameTextBox.Text = task.name;
                taskDescriptionTextBox.Text = task.description;
                projectNameComboBox.SelectedItem = task.project.id.ToString();
                taskStartDatePicker.SelectedDate = task.start;
                taskEndDatePicker.SelectedDate = task.end;
                taskStatusComboBox.SelectedItem = task.status;             
            }
        }
    }
}
