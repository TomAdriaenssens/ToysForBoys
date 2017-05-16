using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToysForBoysLibrary
{
    public class Customer
    {

        private Int32 customerIdValue;
        private String nameValue;
        private String streetAndNumberValue;
        private String cityValue;
        private String stateValue;
        private String postalCodeValue;
        private Int32 countryIdValue;





        //private Int32? omzetValue;  // Nullable Data type porque esta column puede no estar rellena en la BD

        public bool Changed { get; set; }  // Se anade una nueva property para saber 
                                           //si alguna de las otras properties se ha cambiado, por el usuario, y 
                                           // hay que actualizarlo tambien en la BD

        public Int32 CustomerId
        { get { return customerIdValue; } } // AUTONUMBER (sin SET)



        public String Name
        {
            get { return nameValue; }
            set
            {
                nameValue = value;
                Changed = true;    // Si el valor se ha cambiado
            }
        }


        public String StreetAndNumber
        {
            get { return streetAndNumberValue; }
            set
            {
                streetAndNumberValue = value;
                Changed = true;    // Si el valor se ha cambiado
            }
        }

        public String City
        {
            get { return cityValue; }
            set
            {
                cityValue = value;
                Changed = true;    // Si el valor se ha cambiado
            }
        }

        public String State
        {
            get { return stateValue; }
            set
            {
                stateValue = value;
                Changed = true;    // Si el valor se ha cambiado
            }
        }

        public String PostalCode
        {
            get { return postalCodeValue; }
            set
            {
                postalCodeValue = value;
                Changed = true;    // Si el valor se ha cambiado
            }
        }

        public Int32 CountryId
        {
            get { return countryIdValue; }
            set
            {
                countryIdValue = value;
                Changed = true;    // Si el valor se ha cambiado
            }
        }



        public Customer(Int32 customerId, String name, String streetAndNumber, String city, String state, String postalcode,
                         Int32 countryId)
        {

            customerIdValue = customerId;
            this.Name = name;
            this.StreetAndNumber = streetAndNumber;
            this.City = city;
            this.State = state;
            this.PostalCode = postalcode;
            this.CountryId = countryId;

            this.Changed = false; // Al crear un objeto, ninguna property se ha cambiado por defecto
        }
        public Customer() { }
    }
}