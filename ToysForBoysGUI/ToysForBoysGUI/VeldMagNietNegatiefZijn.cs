using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;
using System.Windows.Controls;

namespace ToysForBoysGUI
{
    public class VeldMagNietNegatiefZijn : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            decimal decNumber;
            
            if (Decimal.TryParse(value.ToString(), out decNumber))
            {
                if (decNumber < 0)
                {
                    return new ValidationResult(false, "Veld moet groter zijn dan nul.");
                }
                else
                    return ValidationResult.ValidResult;
            }
            return new ValidationResult(false, "Veld moet een getal zijn.");
        }
    }
}
