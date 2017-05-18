using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using ToysForBoysLibrary;

namespace ToysForBoysGUI
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class ProductsView : Window
    {

        private CollectionViewSource productsViewSource;
        public ObservableCollection<Product> productsOb = new ObservableCollection<Product>();
        public List<Productline> productlinesList = new List<Productline>();

        /// <summary>
        /// 
        /// </summary>
        public List<Product> deletedProducts = new List<Product>();
        public List<Product> newProducts = new List<Product>();
        public List<Product> modifiedProducts = new List<Product>();



        public ProductsView()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            VulDeGrid();
            VulDeComboBox();
        }



        private void VulDeGrid()
        {
            productsViewSource = (CollectionViewSource)(this.FindResource("productViewSource"));
            var prodManager = new ProductManager();

            Productline selectedProductLine = (Productline)comboBoxProductLine.SelectedValue;
            


            if (comboBoxProductLine.SelectedIndex <= 0)
            {
                productsOb = prodManager.GetProductsByProductLineName("");
            }
            else
            {
                productsOb = prodManager.GetProductsByProductLineName(selectedProductLine.Name);
            }
            productsViewSource.Source = productsOb;
            productsOb.CollectionChanged += this.OnCollectionChanged;

        }

        private void VulDeComboBox()
        {
            productlinesList = ProductlineManager.GetProductlines();

            productlinesList.Insert(0, new Productline { Name = "All Models" });
            comboBoxProductLine.ItemsSource = productlinesList;
            comboBoxProductLine.SelectedIndex = 0;
        }

        void OnCollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {


            if (e.NewItems != null)
            {
                foreach (Product nieuweProduct in e.NewItems)
                {
                    newProducts.Add(nieuweProduct);
                }
            }

        }

        private void comboBoxProductLine_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (comboBoxProductLine.SelectedIndex == 0)
                productDataGrid.Items.Filter = null;
            else
                productDataGrid.Items.Filter = new Predicate<object>(ProductLineIdFilter);

        }
        private void buttonSave_Click(object sender, RoutedEventArgs e)
        {
            productDataGrid.CommitEdit(DataGridEditingUnit.Row, true);

            List<Product> resultaatProducts = new List<Product>();
            var dbManager = new ProductManager();

            foreach (Product p in productsOb)
            {
                if ((p.Changed == true) && (p.Id != 0)) modifiedProducts.Add(p);
                p.Changed = false;
            }


            resultaatProducts.Clear();

            if (modifiedProducts.Count() != 0)
            {
                resultaatProducts = dbManager.UpdateProductToToysForBoys(modifiedProducts);
                if (resultaatProducts.Count > 0)
                {
                    StringBuilder boodschap = new StringBuilder();
                    boodschap.Append("Niet gewijzigd: \n");
                    foreach (var b in resultaatProducts)
                    {
                        boodschap.Append("Nummer: " + b.Id + " : " +
                        b.Name + " niet\n");
                    }
                    MessageBox.Show(boodschap.ToString());
                }

                MessageBox.Show(modifiedProducts.Count - resultaatProducts.Count +
                " Product(s) gewijzigd in de database", "Info", MessageBoxButton.OK,
                MessageBoxImage.Information);


            }

            if (newProducts.Count() != 0)
            {
                resultaatProducts = dbManager.AddNewProductToToysForBoys(newProducts);
                if (resultaatProducts.Count > 0)
                {
                    StringBuilder boodschap = new StringBuilder();
                    boodschap.Append("Niet toegevoegd: \n");
                    foreach (var p in resultaatProducts)
                    {
                        boodschap.Append("Nummer: " + p.Id + " : " + p.Name
                        + " niet\n");
                    }
                    MessageBox.Show(boodschap.ToString());
                }
                MessageBox.Show(newProducts.Count - resultaatProducts.Count +
                " Product(s) toegevoegd aan de database", "Info", MessageBoxButton.OK,
                MessageBoxImage.Information);


            }


            VulDeGrid();

            deletedProducts.Clear();
            newProducts.Clear();
            modifiedProducts.Clear();
        }


        public bool ProductLineIdFilter(object prod)
        {
            Productline selectedProductLine = (Productline)comboBoxProductLine.SelectedValue;
            Product p = prod as Product;
            bool result = (p.ProductlineId == Convert.ToInt16(selectedProductLine.Id));

            return result;
        }




        public bool ProductDiscontinuedFilter(object prod)
        {
            Product p = prod as Product;
            bool result = (p.BuyPrice == 0)  && (p.QuantityInStock == 0);

            return result;
        }

    }

}


