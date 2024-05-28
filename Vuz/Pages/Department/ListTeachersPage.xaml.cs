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
using System.Windows.Media.Media3D;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Vuz.AppServices;
using Vuz.Data;

namespace Vuz.Pages.Department
{
    /// <summary>
    /// Interaction logic for ListTeachersPage.xaml
    /// </summary>
    public partial class ListTeachersPage : Page
    {
        
        public ListTeachersPage()
        {
            InitializeComponent();

        }

        private void TxbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                StudentList.ItemsSource = DbConnect.entObj.Students.Where(x => x.FIO.Contains(TxbSearch.Text)).ToList();
                ResultTxb.Text = StudentList.Items.Count + "/" + DbConnect.entObj.Students.Where(x => x.FIO.Contains(TxbSearch.Text)).Count().ToString();
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        private void CmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (CmbSort.SelectedIndex)
            {
                case 0:
                    StudentList.ItemsSource = DbConnect.entObj.Students.ToList();
                    break;
                case 1:
                    StudentList.ItemsSource = DbConnect.entObj.Students.OrderBy(i => i.FIO).ToList();
                    break;
                case 2:
                    StudentList.ItemsSource = DbConnect.entObj.Students.OrderByDescending(i => i.FIO).ToList();
                    break;


            }
        }

        private void CmbFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

       

        private void btnGoBack_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.GoBack();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {

                CmbFilter.DisplayMemberPath = "Name";
                CmbSort.SelectedIndex = 0;
                CmbFilter.SelectedIndex = 0;

                StudentList.ItemsSource = DbConnect.entObj.Students.Take(15).ToList();

                ResultTxb.Text = StudentList.Items.Count + "/" + DbConnect.entObj.Students.Count().ToString();
            }
            catch (Exception except)
            {

                MessageBox.Show(except.Message, "Что-то пошло не так!", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
        }

        private void StudentList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
