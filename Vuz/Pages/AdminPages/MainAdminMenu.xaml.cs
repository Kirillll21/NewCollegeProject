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
using System.Windows.Navigation;
using System.Windows.Shapes;
using Vuz.AppServices;

namespace Vuz.Pages.AdminPages
{
    /// <summary>
    /// Interaction logic for MainAdminMenu.xaml
    /// </summary>
    public partial class MainAdminMenu : Page
    {
        public MainAdminMenu()
        {
            InitializeComponent();
        }

        private void btnGoUSers_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new UserListPage());
        }

        private void btnGoAddUser_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new AddUsers());
        }

        private void btnGoAddUser_Click_1(object sender, RoutedEventArgs e)
        {

        }

        private void btnGoStudentView_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
