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

            //Productline selectedProductLine = (Productline)comboBoxProductLine.SelectedValue;

            productsOb = prodManager.GetProductsByProductLineName("");
            productDataGrid.Items.Filter = new Predicate<object>(ProductFilter);
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
            productDataGrid.Items.Filter = new Predicate<object>(ProductFilter);
        }

        private void buttonSave_Click(object sender, RoutedEventArgs e)

        {
            productDataGrid.CancelEdit(DataGridEditingUnit.Row);

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

        public bool ProductFilter(object prod)
        {

            bool result = true;

            Product p = prod as Product;

 
            Productline selectedProductLine = (Productline)comboBoxProductLine.SelectedValue;

            if ( comboBoxProductLine.SelectedIndex > 0)
            {
                result = (p.ProductlineId == Convert.ToInt16(selectedProductLine.Id));

            }

            if (result)
            {
                if (Discontinued_checkbox.IsChecked == true)
                {
                    result = (p.BuyPrice == 0);

                    if (!result && Apply_MQC_checkBox.IsChecked == true)
                    {
                        result = (p.QuantityInStock < Convert.ToInt32(Min_Quantity_textBox.Text) && p.BuyPrice != 0);
                    }

                }
                else
                {
                    if (result && Apply_MQC_checkBox.IsChecked == true)
                    {
                        result = (p.QuantityInStock < Convert.ToInt32(Min_Quantity_textBox.Text) && p.BuyPrice != 0);
                    }

                }


            }
 


            



            return result;



        }

        private void Apply_MQC_checkBox_Click(object sender, RoutedEventArgs e)
        {
 

            productDataGrid.Items.Filter = new Predicate<object>(ProductFilter);

        }

        private void Discontinued_checkbox_Click(object sender, RoutedEventArgs e)
        {
            productDataGrid.Items.Filter = new Predicate<object>(ProductFilter);
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
     
            this.Hide();
            e.Cancel = true;
        }


        private void cmdBindingF5_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            productDataGrid.CancelEdit(DataGridEditingUnit.Row);
            comboBoxProductLine.SelectedIndex = 0;
            Discontinued_checkbox.IsChecked = false;
            Apply_MQC_checkBox.IsChecked = false;
            VulDeGrid();
 
        }
    }

    public class ProductlineValueList : List<Productline>
    {
        public ProductlineValueList()
        {
            List<Productline> productLineItems = new List<Productline>();
            productLineItems = ProductlineManager.GetProductlines();
            foreach (var pl in productLineItems)
            {
                this.Add(pl);
            }
        }
    }

}


