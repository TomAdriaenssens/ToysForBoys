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
using System.Windows.Shapes;
using ToysForBoysLibrary;

namespace ToysForBoysGUI
{
    /// <summary>
    /// Interaction logic for CustomersView.xaml
    /// </summary>
    public partial class CustomersView : Window
    {
        private CollectionViewSource customersViewSource;
        public ObservableCollection<Customer> customersOb = new ObservableCollection<Customer>();
        public List<Customer> newCustomers = new List<Customer>();
        public List<Customer> modifiedCustomers = new List<Customer>();

        public CustomersView()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            VulDeGrid();
        }

        private void VulDeGrid()
        {
            customersViewSource = (CollectionViewSource)(this.FindResource("customerViewSource"));
            var custManager = new CustomerManager();

            customersOb = custManager.GetAllCustomers();
            customersViewSource.Source = customersOb;
            customersOb.CollectionChanged += this.OnCollectionChanged;
        }

        void OnCollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.NewItems != null)
            {
                foreach (Customer newCustomer in e.NewItems)
                {
                    newCustomers.Add(newCustomer);
                }
            }
        }


        private void buttonSave_Click(object sender, RoutedEventArgs e)
        {
            customerDataGrid.CommitEdit(DataGridEditingUnit.Row, true);

            List<Customer> resultaatProducts = new List<Customer>();
            var dbManager = new CustomerManager();

            foreach (Customer p in customersOb)
            {
                if ((p.Changed == true) && (p.Id!= 0)) modifiedCustomers.Add(p);
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
