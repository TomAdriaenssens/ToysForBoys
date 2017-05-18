using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToysForBoysLibrary
{
    public class Order
    {
        private int id;
        private DateTime orderDate;
        private DateTime requiredDate;
        private DateTime shippedDate;
        private string comments;
        private int customerId;
        private string status;
        private bool changed;

        public int Id
        {
            get { return id; }
        }
        public DateTime OrderDate
        {
            get { return orderDate; }
            set { orderDate = value;
                Changed = true;
            }
        }
        public DateTime RequiredDate
        {
            get { return requiredDate; }
            set { requiredDate = value;
                Changed = true;
            }
        }
        public DateTime ShippedDate
        {
            get { return shippedDate; }
            set { orderDate = value;
                Changed = true;
            }
        }
        public string Comments
        {
            get { return comments; }
            set { comments = value;
                Changed = true;
            }
        }
        public int CustomerId
        {
            get { return customerId; }
            set { customerId = value;
                Changed = true;
            }
        }
        public string Status
        {
            get { return status; }
            set { status = value;
                Changed = true;
            }
        }
        public bool Changed
        {
            get { return changed; }
            set
            {
                changed = value;
            }
        }

        public Order(int id, DateTime orderDate, DateTime requiredDate, DateTime shippedDate, string comments, int customerid, string status)
        {
            this.id = id;
            OrderDate = orderDate;
            RequiredDate = requiredDate;
            ShippedDate = shippedDate;
            Comments = comments;
            CustomerId = customerid;
            Status = status;
            Changed = false;
        }

        public Order() { }
    }
}
