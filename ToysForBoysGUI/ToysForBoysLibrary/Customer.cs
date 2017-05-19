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
        private String emailValue;

        
        public bool Changed { get; set; }  

        public Int32 CustomerId
        { get { return customerIdValue; } } 



        public String Name
        {
            get { return nameValue; }
            set
            {
                nameValue = value;
                Changed = true;    //Als de waarde veranderd is
            }
        }


        public String StreetAndNumber
        {
            get { return streetAndNumberValue; }
            set
            {
                streetAndNumberValue = value;
                Changed = true;    //Als de waarde veranderd is
            }
        }

        public String City
        {
            get { return cityValue; }
            set
            {
                cityValue = value;
                Changed = true;    //Als de waarde veranderd is
            }
        }

        public String State
        {
            get { return stateValue; }
            set
            {
                stateValue = value;
                Changed = true;    //Als de waarde veranderd is
            }
        }

        public String PostalCode
        {
            get { return postalCodeValue; }
            set
            {
                postalCodeValue = value;
                Changed = true;    //Als de waarde veranderd is
            }
        }

        public Int32 CountryId
        {
            get { return countryIdValue; }
            set
            {
                countryIdValue = value;
                Changed = true;    //Als de waarde veranderd is
            }
        }

        public String Email
        {
            get { return emailValue; }
            set
            {
                emailValue = value;
                Changed = true;    //Als de waarde veranderd is
            }
        }



        public Customer(Int32 customerId, String name, String streetAndNumber, String city, String state, String postalcode,
                         Int32 countryId, String email)
        {

            customerIdValue = customerId;
            this.Name = name;
            this.StreetAndNumber = streetAndNumber;
            this.City = city;
            this.State = state;
            this.PostalCode = postalcode;
            this.CountryId = countryId;
            this.Email = email;

            this.Changed = false;
        }
        public Customer() { }
    }
}