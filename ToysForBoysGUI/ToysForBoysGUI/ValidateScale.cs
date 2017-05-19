using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Globalization;
using System.Text.RegularExpressions;

namespace ToysForBoysGUI
{
    class ValidateScale : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            string scaleRegEx = @"^\d{*}+/\+d{*}";
            Regex currencyRegex = new Regex(scaleRegEx);
            if (currencyRegex.IsMatch(value.ToString()))
            {
               return ValidationResult.ValidResult;
            }
            return new ValidationResult(false, "Scale moet van formaat \"x/x\" zijn.");
        }

    }
}
