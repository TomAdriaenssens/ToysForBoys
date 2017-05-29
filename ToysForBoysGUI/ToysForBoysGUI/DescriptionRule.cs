using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Globalization;
using System.Windows.Data;
using ToysForBoysLibrary;

namespace ToysForBoysGUI
{
    class DescriptionRule : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {

            string str;

            if (value is BindingGroup)

                str = (string)((Product)(value as BindingGroup).Items[0]).Description;

            else

            {
                str = value.ToString();

            }

            if (string.IsNullOrWhiteSpace(str))
            {
                return new ValidationResult(false, "Veld moet ingevuld zijn.");
            }
            return ValidationResult.ValidResult;
        }
    }
}
