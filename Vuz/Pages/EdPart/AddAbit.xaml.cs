﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
using Vuz.Data;

namespace Vuz.Pages.EdPart
{
    /// <summary>
    /// Interaction logic for AddAbit.xaml
    /// </summary>
    public partial class AddAbit : Page
    {
        private Abiturient AbitObj = new Abiturient();
        public AddAbit(Abiturient aAbiturient)
        {
            InitializeComponent();

            

            if (aAbiturient != null)
                AbitObj = aAbiturient;

            DataContext = AbitObj;
            
        }

        private void btnSubmit_Click(object sender, RoutedEventArgs e)
        {
            if (DbConnect.entObj.Students.Count(x => x.FIO == Familia.Text) > 0)
            {
                System.Windows.MessageBox.Show("Такой студент уже есть!",
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Information);
                return;
            }
            else
            {
                if (Familia.Text == null | Familia.Text.Trim() == "" | Imya.Text == null | Imya.Text.Trim() == "" | Otch.Text == null | Otch.Text.Trim() == "" | BirthDate.Text == null | BirthDate.Text.Trim() == "" | BirthPlace.Text == null | BirthPlace.Text.Trim() == "")
                {
                    System.Windows.MessageBox.Show("Заполните все поля!",
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Information);
                }
                else
                {
                    try
                    {
                        DateTime dt = DateTime.ParseExact(BirthDate.Text, "dd.MM.yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        var FIO = Familia.Text + " " + Imya.Text + " " + Otch.Text;
                        

                        Students StudentObj = new Students()
                        {
                            Familia = Familia.Text,
                            Imya = Imya.Text,
                            Otch = Otch.Text,
                            FIO = FIO,
                            GenderId = Gender.Text,
                            Nationality = Nationality.Text,
                            BirthDate = Convert.ToDateTime(Regex.Replace(BirthDate.Text, "\u200e", string.Empty)),
                            BirthPlace = BirthPlace.Text,
                            RegistrationtAddress = RegistrationtAddress.Text,
                            ActualAddress = ActualAddress.Text,
                            Education = Education.Text,
                            FatherFio = FatherFio.Text,
                            FatherJobPlace = FatherJobPosition.Text,
                            FatherJobPosition = FatherJobPosition.Text,
                            MotherFio = MotherFio.Text,
                            MotherJobPlace = MotherJobPosition.Text,
                            MotherJobPosition = MotherJobPosition.Text,
                            FatherTelepthone = FatherTelepthone.Text,
                            MotherTelephone = MotherTelepthone.Text,
                            MotherAdress = MotherAdress.Text,
                            FatherAdress = FatherAdress.Text


                        };

                        DbConnect.entObj.Students.Add(StudentObj);
                        DbConnect.entObj.SaveChanges();

                        System.Windows.MessageBox.Show("Абитуриент переведен",
                            "Уведомление",
                            MessageBoxButton.OK,
                            MessageBoxImage.Information);
                    }
                    catch (Exception ex)
                    {
                        System.Windows.MessageBox.Show("Ошибка: " + ex.Message.ToString(),
                        "Критический сбой работы приложения",
                        MessageBoxButton.OK,
                        MessageBoxImage.Warning);
                    }
                }
            }
        
    }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.GoBack();
        }
    }
}
