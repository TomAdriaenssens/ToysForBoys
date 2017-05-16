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
        private int quantityInStock;
        private int quantityInOrder;
        private decimal buyPrice;
        private int productlineId;

        public int Id
        {
            get { return id; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string Scale
        {
            get { return scale; }
            set { scale = value; }
        }
        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        public int QuantityInStock
        {
            get { return quantityInStock; }
            set { quantityInStock = value; }
        }
        public int QuantityInOrder
        {
            get { return quantityInOrder; }
            set { quantityInOrder = value; }
        }
        public decimal BuyPrice
        {
            get { return buyPrice; }
            set { value = buyPrice; }
        }
        public int ProductlineId
        {
            get { return productlineId; }
            set { productlineId = value; }
        }
        public Product(int newId, string newName, string newScale, string newDescr, int newInSTock, int newInOrder, decimal newPrice, int newProductLineId)
        {
            id = newId;
            Name = newName;
            Description = newDescr;
            QuantityInStock = newInSTock;
            QuantityInOrder = newInOrder;
            BuyPrice = newPrice;
            ProductlineId = newProductLineId;
            Scale = newScale;
        }

        public Product() { }
    }
}
