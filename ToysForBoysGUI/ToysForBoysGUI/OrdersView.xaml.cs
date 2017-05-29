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
    /// Interaction logic for OrdersView.xaml
    /// </summary>
    public partial class OrdersView : Window
    {
        private CollectionViewSource ordersViewSource;
        public ObservableCollection<Order> ordersOb = new ObservableCollection<Order>();
        public List<Order> newOrders = new List<Order>();
        public List<Order> modifiedOrders = new List<Order>();

        public OrdersView()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            VulDeGrid();
        }

        private void VulDeGrid()
        {
            ordersViewSource = (CollectionViewSource)(this.FindResource("orderViewSource"));
            var ordManager = new OrderManager();
            
            ordersOb = ordManager.GetAllOrders();
            ordersViewSource.Source = ordersOb;
            ordersOb.CollectionChanged += this.OnCollectionChanged;
        }

        void OnCollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.NewItems != null)
            {
                foreach (Order newOrder in e.NewItems)
                {
                    newOrders.Add(newOrder);
                }
            }
        }

        private void buttonSave_Click(object sender, RoutedEventArgs e)
        {
            orderDataGrid.CommitEdit(DataGridEditingUnit.Row, true);

            List<Order> resultaatProducts = new List<Order>();
            var dbManager = new OrderManager();

            foreach (Order p in ordersOb)
            {
                if ((p.Changed == true) && (p.Id != 0)) modifiedOrders.Add(p);
                p.Changed = false;
            }
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            this.Hide();
            e.Cancel = true;

        }
    }
}
