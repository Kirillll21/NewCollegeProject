﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Vuz.AppServices;
using Vuz.Data;

namespace Vuz.Pages.AdminPages.AdminListPages
{
    /// <summary>
    /// Interaction logic for StudentsListPage.xaml
    /// </summary>
    public partial class StudentsListPage : Page
    {
        public StudentsListPage()
        {
            InitializeComponent();


        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            DgrStudent.ItemsSource = DbConnect.entObj.Students.ToList();
            try
            {
                
                CmbFilter.DisplayMemberPath = "Name";
                CmbSort.SelectedIndex = 0;
                CmbFilter.SelectedIndex = 0;

                DgrStudent.ItemsSource = DbConnect.entObj.Students.Take(15).ToList();

                ResultTxb.Text = DgrStudent.Items.Count + "/" + DbConnect.entObj.Students.Count().ToString();
            }
            catch (Exception except)
            {

                System.Windows.MessageBox.Show(except.Message, "Что-то пошло не так!", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
        }

        private void StudentList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void CmbFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void CmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (CmbSort.SelectedIndex)
            {
                case 0:
                    DgrStudent.ItemsSource = DbConnect.entObj.Students.ToList();
                    break;
                case 1:
                    DgrStudent.ItemsSource = DbConnect.entObj.Students.OrderBy(i => i.FIO).ToList();
                    break;
                case 2:
                    DgrStudent.ItemsSource = DbConnect.entObj.Students.OrderByDescending(i => i.FIO).ToList();
                    break;

            }
        }

        private void TxbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {

            try
            {
                DgrStudent.ItemsSource = DbConnect.entObj.Students.Where(x => x.FIO.Contains(TxbSearch.Text)).ToList();
                ResultTxb.Text = DgrStudent.Items.Count + "/" + DbConnect.entObj.Students.Where(x => x.FIO.Contains(TxbSearch.Text)).Count().ToString();
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        private void btnAddStd_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new AddStudentsPage(null));
        }

        private void btnDelStd_Click(object sender, RoutedEventArgs e)
        {
            var studentsForRemoving = DgrStudent.SelectedItems.Cast<Students>().ToList();

            var cancel = System.Windows.Forms.MessageBox.Show("Вы подтверждаете удаление?",
                            "Подтверждение",
                            MessageBoxButtons.OKCancel);
            if (DialogResult.Cancel == cancel)
            {
                FrameApp.frmObj.Navigate(new StudentsListPage());
            }
            else
            {

                try
                {
                    DbConnect.entObj.Students.RemoveRange(studentsForRemoving);
                    DbConnect.entObj.SaveChanges();
                    System.Windows.MessageBox.Show("Данные удалены");

                    DgrStudent.ItemsSource = DbConnect.entObj.Students.ToList();
                }
                catch (Exception ex)
                {
                    System.Windows.MessageBox.Show(ex.Message.ToString());

                }
            }
        }

        private void btnGoBack_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.GoBack();
        }

        private void DgrStudent_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new AddStudentsPage((sender as System.Windows.Controls.Button).DataContext as Students));
        }

        private void DgrStudent_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            
        }
    }
}
