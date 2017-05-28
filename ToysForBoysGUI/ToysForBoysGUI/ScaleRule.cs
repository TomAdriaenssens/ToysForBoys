using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Windows.Data;
using ToysForBoysLibrary;

namespace ToysForBoysGUI
{
    class ScaleRule : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            string valueString = string.Empty;

            if (value is BindingGroup)
                valueString = ((Product)(value as BindingGroup).Items[0]).Scale;
            else

                valueString = value.ToString();

            string scaleRegEx = @"^[1-9]\:[1-9]\d{0,2}$";
            Regex currencyRegex = new Regex(scaleRegEx);
            if (currencyRegex.IsMatch(valueString.Trim()))
            {
               return ValidationResult.ValidResult;
            }
            return new ValidationResult(false, "Scale moet van formaat \"9:999\" zijn.");
        }

    }
}
