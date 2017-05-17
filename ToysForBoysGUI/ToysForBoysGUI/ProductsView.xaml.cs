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
    public partial class BrouwersView : Window
    {

        private CollectionViewSource productsViewSource;
        public ObservableCollection<Product> productsOb = new ObservableCollection<Product>();
        public List<Productline> productlinesList = new List<Productline>();

        public List<Product> OudeProducts = new List<Product>();
        public List<Product> newProducts = new List<Product>();
        public List<Product> modifiedProducts = new List<Product>();



        public BrouwersView()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            VulDeComboBox();
            VulDeGrid();
        }



        private void VulDeGrid()
        {
            productsViewSource = (CollectionViewSource)(this.FindResource("productViewSource"));
            var prodManager = new ProductManager();

            string category = null;

            if (comboBoxProductLine.SelectedItem != null)
            {
                category = comboBoxProductLine.SelectedItem.ToString();
            }
            productsOb = prodManager.GetProductsByProductLineName(category);
            productsViewSource.Source = productsOb;
            productsOb.CollectionChanged += this.OnCollectionChanged;

        }

        private void VulDeComboBox ()
        {
            productlinesList = ProductlineManager.GetProductlines();
            foreach (Productline prodline in productlinesList)
            {
                comboBoxProductLine.Items.Add(prodline.Name);
            }
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


        private void buttonSave_Click(object sender, RoutedEventArgs e)
        {

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
                }
                MessageBox.Show(modifiedProducts.Count - resultaatProducts.Count +
                " Product(s) gewijzigd in de database", "Info", MessageBoxButton.OK,
                MessageBoxImage.Information);

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
            }
            MessageBox.Show(newProducts.Count - resultaatProducts.Count +
            " Product(s) toegevoegd aan de database", "Info", MessageBoxButton.OK,
            MessageBoxImage.Information);


            VulDeGrid();

                OudeProducts.Clear();
                newProducts.Clear();
                modifiedProducts.Clear();
            }

        private void comboBoxProductLine_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            VulDeGrid();
        }
    }

}


