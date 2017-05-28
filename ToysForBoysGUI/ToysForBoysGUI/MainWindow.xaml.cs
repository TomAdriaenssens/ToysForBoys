using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

namespace ToysForBoysGUI
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        ProductsView productsView = new ProductsView();
        OrdersView ordersView = new OrdersView();
        ProductsView customersView = new ProductsView();

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Producten_MenuItem_Click(object sender, RoutedEventArgs e)
        {

            productsView.Owner = this;
            productsView.Show();

        }

        private void Klanten_MenuItem_Click(object sender, RoutedEventArgs e)
        {
            customersView.Owner = this;
            customersView.Show();


        }

        private void Orders_MenuItem_Click(object sender, RoutedEventArgs e)
        {

            ordersView.Owner = this;
            ordersView.Show();


        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (MessageBox.Show("Programma afsluiten ?",
                        "Afsluiten",
                        MessageBoxButton.YesNo,
                        MessageBoxImage.Question,
                        MessageBoxResult.No) == MessageBoxResult.No)
                e.Cancel = true;
            else
            {
                //productsView.Close();
                //ordersView.Close();
                //customersView.Close();
                Application.Current.Shutdown();

            }
        }

        private void CloseExecuted(object sender, ExecutedRoutedEventArgs e)
        {
            this.Close();

        }

        private void button_Login_Click(object sender, RoutedEventArgs e)
        {
            LoginLayer.Visibility = Authenticate_User(txtName.Text, txtPassword.Password) ? Visibility.Collapsed : Visibility.Visible;
        }

        private bool Authenticate_User(string text, string password)
        {
            return true;
        }
    }
}
