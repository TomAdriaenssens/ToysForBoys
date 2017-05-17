using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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


        public BrouwersView()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            VulDeGrid();
        }



        private void VulDeGrid()
        {
            productsViewSource = (CollectionViewSource)(this.FindResource("productViewSource"));
            var prodManager = new ProductManager();
            productsOb = prodManager.GetProductsByProductLineName(string.Empty);
            productsViewSource.Source = productsOb;
        }

        private void VulAanProductLines()
        {

        }
    }
}
