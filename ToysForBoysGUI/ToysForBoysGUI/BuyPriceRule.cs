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
    public class BuyPriceRule : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
           decimal decNumber;
            NumberStyles style = NumberStyles.Currency;

            if (value is BindingGroup)

                decNumber = (decimal)((Product)(value as BindingGroup).Items[0]).BuyPrice;

            else

            {
                if (!decimal.TryParse(value.ToString(), style, cultureInfo, out decNumber))
                    return new ValidationResult(false, "Veld moet een getal zijn.");

            }

                

                if (decNumber <= 0)

                    return new ValidationResult(false, "Veld moet groter zijn dan nul.");
                else
                    return ValidationResult.ValidResult;
            
        }
    }
}
