using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;
using System.Windows.Controls;
using System.Windows.Data;
using ToysForBoysLibrary;

namespace ToysForBoysGUI
{
    public class QuantityInOrderRule : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
           int intNumber;

            if (value is BindingGroup)

                intNumber = (int)((Product)(value as BindingGroup).Items[0]).QuantityInOrder;

            else

            {
                if (!int.TryParse(value.ToString(), out intNumber))
                    return new ValidationResult(false, "Veld moet een geheel getal zijn.");

            }

                

                if (intNumber <= 0)

                    return new ValidationResult(false, "Veld moet groter zijn dan nul.");
                else
                    return ValidationResult.ValidResult;
            
        }
    }
}
