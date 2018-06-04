using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace LaravelAdminMysql
{
    public class EMailPhoneValidationRule : ValidationRule
    {
        private string _errorMessage;
        private string _type;
        public string ErrorMessage
        {
            get { return _errorMessage; }
            set { _errorMessage = value; }
        }

        public string Type
        {
            get { return _type; }
            set {_type = value;}
        }

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            ValidationResult result = new ValidationResult(true, null);
            string inputString = (value ?? string.Empty).ToString();
            switch (_type)
            {
                case "email":
                    {
                        if (inputString == "")
                        {
                            return result;
                        }
                        Regex regex = new Regex(@"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                        if (!regex.IsMatch(inputString))
                        {
                            result = new ValidationResult(false, this.ErrorMessage);
                        }
                        break;
                    }
                case "phone":
                    {
                        Regex regex = new Regex(@"^(\+[0-9]{12})$");
                        if (!regex.IsMatch(inputString))
                        {
                            result = new ValidationResult(false, this.ErrorMessage);
                        }
                        break;
                    }
                default:
                    break;
            }
            return result;
        }
    }
}
