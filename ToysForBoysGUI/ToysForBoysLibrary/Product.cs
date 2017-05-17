using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToysForBoysLibrary
{
    public class Product
    {
        private int id;
        private string name;
        private string scale;
        private string description;
        private int? quantityInStock;
        private int? quantityInOrder;
        private decimal? buyPrice;
        private int? productlineId;
        private bool changed;

        public int Id
        {
            get { return id; }
        }
        public string Name
        {
            get { return name; }
            set { name = value;
                changed = true;  }
        }
        public string Scale
        {
            get { return scale; }
            set { scale = value;
                changed = true;
            }
        }
        public string Description
        {
            get { return description; }
            set { description = value;
                changed = true;
            }
        }
        public int? QuantityInStock
        {
            get { return quantityInStock; }
            set { quantityInStock = value;
                changed = true;
            }
        }
        public int? QuantityInOrder
        {
            get { return quantityInOrder; }
            set { quantityInOrder = value;
                changed = true;
            }
        }
        public decimal? BuyPrice
        {
            get { return buyPrice; }
            set { buyPrice = value;
                changed = true;
            }
        }
        public int? ProductlineId
        {
            get { return productlineId; }
            set {
                productlineId = value;
                changed = true;
            }
        }
        public Product(int id, string name, string scale, string descr, int? inSTock, int? inOrder, decimal? price, int? productLineId)
        {
            this.id = id;
            Name = name;
            Description = descr;
            QuantityInStock = inSTock;
            QuantityInOrder = inOrder;
            BuyPrice = price;
            ProductlineId = productLineId;
            Scale = scale;
            changed = false;
        }

        public Product() { }
    }
}
