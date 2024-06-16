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
using Vuz.Pages.AdminPages.AdminListPages;

namespace Vuz.Pages.EdPart
{
    /// <summary>
    /// Interaction logic for EdMenuPage.xaml
    /// </summary>
    public partial class EdMenuPage : Page
    {
        public EdMenuPage()
        {
            InitializeComponent();
        }

        private void btnAbit_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new ListAbit());
        }

        private void AddAbit_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new AnketaAbiturienta());
        }

        private void btnGoStudentView_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new StudentsListPage());
        }

      

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.GoBack();
        }

        private void TransAbit_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new AddAbit(null));
        }
    }
}
