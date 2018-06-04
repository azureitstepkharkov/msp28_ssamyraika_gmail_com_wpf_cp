using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
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
    /// Interaction logic for FormUser.xaml
    /// </summary>
    public partial class FormUser : Window
    {
        private sql3238345Entities context;
        private user user;
        private bool saveTrigger = false;
        private bool update = false;

        private string fileName = String.Empty;
        private bool changeImage = false;

        public user User
        {
            get
            {
                return user;
            }

            set
            {
                user = value;
            }
        }

        private FormUser()
        {
            InitializeComponent();
            
        }

        public FormUser(sql3238345Entities context)
        {
            InitializeComponent();
            this.context = context;
            User = new user();
            this.DataContext = User;
            CheckBoxChangePassword.IsChecked = true;
            CheckBoxChangePassword.Visibility = Visibility.Hidden;
        }

        public FormUser(user user, sql3238345Entities context)
        {
            this.user = user;
            this.context = context;
            InitializeComponent();
            this.DataContext = user;
            this.update = true;
            OpenImage();
        }

        private void OpenImage()
        {
            if(user.image != null)
            {
                try
                {
                    string FtpUrl = Resource.FtpUrl;
                    string path = "/public_html/public/images";
                    WebClient myWebClient = new WebClient();
                    myWebClient.Credentials = new NetworkCredential(Resource.FtpUserName, Resource.FtpUserPassw);
                    string downloadUrl = String.Format("{0}{1}/{2}", FtpUrl, path, user.image);
                    Byte[] pageData = myWebClient.DownloadData(downloadUrl);
                    imgData.Source = ByteToImage(pageData);
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void SaveUser_Click(object sender, RoutedEventArgs e)
        {
            if (!update)
            {
                userEmailTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                userNameTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();

                user.status = "active";
                
                if (Validation.GetHasError(userEmailTextBox) == true ||
                        Validation.GetHasError(userNameTextBox) == true ||
                        Validation.GetHasError(userPasswordTextBox) == true || 
                        userPasswordTextBox.Text != userConfirmPasswordTextBox.Text||
                        userPasswordTextBox.Text == String.Empty)
                {
                    MessageBox.Show("Есть не верно заполненные поля, запись не сохранится");
                    this.Close();
                    return;
                }
                else
                {
                    string mySalt = BCrypt.Net.BCrypt.GenerateSalt();
                    //mySalt == "$2a$10$rBV2JDeWW3.vKyeQcM8fFO"
                    string myHash = BCrypt.Net.BCrypt.HashPassword(userPasswordTextBox.Text, mySalt);
                    user.password = myHash;
                    context.users.Local.Add(User);
                    context.SaveChanges();
                    role Roleclient = context.roles.Find(2);
                    Roleclient.users.Add(user);
                    context.SaveChanges();
                }
            }
            if (imgData.Source != null && changeImage)
            {
                try
                {
                    FTPLoader.UploadFile(fileName, "/public_html/public/images");
                    //FTPLoader.UploadFile(fileName);
                    string PureFileName = new FileInfo(fileName).Name;
                    user.image = PureFileName;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            if(CheckBoxChangePassword.IsChecked == true)
            {
                if(userPasswordTextBox.Text != userConfirmPasswordTextBox.Text ||
                        userPasswordTextBox.Text == String.Empty)
                {
                    MessageBox.Show("Incorrect password or password confirmation");
                }
                else
                {
                    string mySalt = BCrypt.Net.BCrypt.GenerateSalt();
                    //mySalt == "$2a$10$rBV2JDeWW3.vKyeQcM8fFO"
                    string myHash = BCrypt.Net.BCrypt.HashPassword(userPasswordTextBox.Text, mySalt);
                    user.password = myHash;
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
                             .Entries<user>()
                             .Where(re => re.State == EntityState.Modified))
                {
                    entry.CurrentValues.SetValues(entry.OriginalValues);
                }
                userEmailTextBox.Text = User.email;
                userNameTextBox.Text = User.name;
                userPasswordTextBox.Text = User.password;
                userConfirmPasswordTextBox.Text = User.password; 
            }
        }

        private void SelectImage_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.Title = "Выберите файл"; //заголовок диалогового окна
                                         //далее фильтры : название фильтра: "bmp files (*.bmp)", маска фильтра: "*.bmp"
            dlg.Filter = "Image Files(*.BMP;*.JPG;*.GIF)|*.BMP;*.JPG;*.GIF|All files (*.*)|*.*";
            if (dlg.ShowDialog() == true)
            {
                string fullname = dlg.FileName;
                if (File.Exists(fullname))
                    try
                    {
                        imgData.Source = new BitmapImage(new Uri(fullname, UriKind.Absolute));
                        fileName = fullname;
                        changeImage = true;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                    }
            }
        }

        public static BitmapImage ByteToImage(byte[] array)
        {
            using (var ms = new System.IO.MemoryStream(array))
            {
                var image = new BitmapImage();
                image.BeginInit();
                image.CacheOption = BitmapCacheOption.OnLoad; // here
                image.StreamSource = ms;
                image.EndInit();
                return image;
            }
        }
    }
}
