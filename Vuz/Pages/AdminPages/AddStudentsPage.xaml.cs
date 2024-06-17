using iText.IO.Font;
using iText.Kernel.Colors;
using iText.Kernel.Font;
using iText.Kernel.Pdf;
using iText.Kernel.Pdf.Canvas;
using iText.Layout;
using iText.Layout.Element;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.IO;
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
using System.Xml.Linq;
using Vuz.AppServices;
using Vuz.Data;

namespace Vuz.Pages.AdminPages
{
    /// <summary>
    /// Interaction logic for AddStudentsPage.xaml
    /// </summary>
    public partial class AddStudentsPage : Page
    {
        private Students StudentObj = new Students();
        public AddStudentsPage(Students sStudent)
        {
            InitializeComponent();
            if (sStudent != null)
                StudentObj = sStudent;

            DataContext = StudentObj;
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.GoBack();
        }

        private void btnSubmit_Click(object sender, RoutedEventArgs e)
        {

            var fio = Familia.Text + " " + Imya.Text + " " + Otch.Text;
            DateTime dt = DateTime.ParseExact(BirthDate.Text, "dd.MM.yyyy", System.Globalization.CultureInfo.InvariantCulture);

            if (DbConnect.entObj.Students.Count(x => x.FIO == fio) > 0)
            {
                System.Windows.MessageBox.Show("Такой студент уже есть!",
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Information);
                return;
            }
            else
            {
                

                try
                    {

                    Students StudentObj = new Students()
                    {
                        Familia = Familia.Text,
                        Imya = Imya.Text,
                        Otch = Otch.Text,
                        FIO = fio,
                        GroupName = Group.Text,
                        GenderId = Gender.Text,
                        Nationality = TxbNationality.Text,
                        BirthDate = dt,
                        BirthPlace = BirthPlace.Text,
                        RegistrationtAddress = RegistrationtAddress.Text,
                        ActualAddress = ActualAddress.Text,
                        Education = Education.Text,
                        FatherFio = FatherFio.Text,
                        FatherAdress = FatherAdress.Text,
                        FatherJobPlace = FatherJobPlace.Text,
                        FatherJobPosition = FatherJobPosition.Text,
                        FatherTelepthone = FatherTelepthone.Text,
                        MotherAdress = MotherAdress.Text,
                        MotherFio = MotherFio.Text,
                        MotherJobPlace = MotherJobPlace.Text,
                        MotherJobPosition = MotherJobPosition.Text,
                        MotherTelephone = MotherTelepthone.Text
                        };

                        DbConnect.entObj.Students.Add(StudentObj);
                        DbConnect.entObj.SaveChanges();

                        System.Windows.MessageBox.Show("Студент добавлен!",
                            "Уведомление",
                            MessageBoxButton.OK,
                            MessageBoxImage.Information);
                    }
                    catch (Exception ex)
                    {
                        System.Windows.MessageBox.Show("Ошибка добавления студента: " + ex.Message.ToString(),
                        "Критический сбой работы приложения",
                        MessageBoxButton.OK,
                        MessageBoxImage.Warning);
                    }
                
            }
        }

        private void CmbFilterGroup_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {



        }

        private void CmbFilterGender_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
        



        }

        private void CmbFilterGroup_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {

        }

        private void btnCreateCard_Click(object sender, RoutedEventArgs e)
        {
            var dest = "d:\\demo.pdf";
            var file = new FileInfo(dest);
            file.Directory?.Create();



            var docPdf = new PdfDocument(new PdfWriter(dest));

            var doc = new iText.Layout.Document(docPdf);
            var page = docPdf.AddNewPage();

            var ItalicTNR = PdfFontFactory.CreateFont("C:\\Users\\Kirill\\source\\repos\\Vuz\\Vuz\\Fonts\\ItalicTimesNewRoman.ttf", PdfEncodings.IDENTITY_H);
            var TNR = PdfFontFactory.CreateFont("C:\\Users\\Kirill\\source\\repos\\Vuz\\Vuz\\Fonts\\TimesNewRoman.ttf",PdfEncodings.IDENTITY_H);
            var BoldTNR = PdfFontFactory.CreateFont("C:\\Users\\Kirill\\source\\repos\\Vuz\\Vuz\\Fonts\\TimesNewRomanBold.ttf", PdfEncodings.IDENTITY_H);
            
            docPdf.AddFont(TNR);



            var canvas = new PdfCanvas(page);           

            
            iText.Layout.Element.Table table = new iText.Layout.Element.Table(1, false)
                .SetWidth(525);

            Cell cell11 = new Cell(1, 1)
               .SetBorderTop(null)
               .SetBorderLeft(null)
               .SetBorderRight(null)
               .SetPaddingBottom(0)
               .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
               .SetFont(ItalicTNR)
               .Add(new iText.Layout.Element.Paragraph("Нижегородский облпотребсоюз"));

            Cell cell12 = new Cell(2, 1)
                .SetBorderLeft(null)
               .SetBorderRight(null)
               .SetFont(TNR)
               .SetBorderBottom(null)
               .SetPaddingTop(-3)
               .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
               .Add(new iText.Layout.Element.Paragraph("(наименование министерства, ведомства)"));

            Cell cell21 = new Cell(3, 1)
               .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
               .SetFont(ItalicTNR)
               .SetBorderLeft(null)
               .SetBorderRight(null)
               .SetBorderTop(null)
               .SetPaddingTop(-6)
               .SetStrokeWidth(100)
               .Add(new iText.Layout.Element.Paragraph("НИЖЕГОРОДСКИЙ ЭКОНОМИКО-ТЕХНОЛОГИЧЕСКИЙ КОЛЛЕДЖ")); 
            Cell cell22 = new iText.Layout.Element.Cell(4, 1)
                .SetFont(TNR)
                .SetBorderLeft(null)
               .SetBorderRight(null)
               .SetBorderBottom(null)
               .SetPaddingTop(-5)
               .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
               .Add(new iText.Layout.Element.Paragraph("(наименование образовательного учреждения)"));

            Cell cell31 = new iText.Layout.Element.Cell(5, 1)
                .SetFont(ItalicTNR)
                .SetBorderLeft(null)
               .SetBorderRight(null)
               .SetPaddingTop(-5)
               .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
               .SetBorderTop(null)
               .Add(new iText.Layout.Element.Paragraph("Нижегородская область, г. Арзамас, пр. Ленина, д. 200"));
            Cell cell32 = new Cell(6, 1)
               .SetFont(TNR)
               .SetFontSize(12)
               .SetBorderLeft(null)
               .SetBorderRight(null)
               .SetBorderBottom(null)
               .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
               .SetPaddingTop(-5)
               .Add(new iText.Layout.Element.Paragraph("(адрес образовательного учреждения)"));


            iText.Layout.Element.Table table2 = new iText.Layout.Element.Table(4, false)
               .SetWidth(525);
            Cell cell211 = new Cell(1, 1)
               .SetBorder(null)
               .SetFont(ItalicTNR)
               .SetWidth(100)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell cell221 = new Cell(1, 1)
               .SetBorder(null)
               .SetFont(BoldTNR)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell cell231 = new Cell(1, 1)
               .SetBorder(null)
               .SetFont(BoldTNR)
               .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
               .Add(new iText.Layout.Element.Paragraph("ЛИЧНАЯ КАРТОЧКА СТУДЕНТА"));

            Cell cell2311 = new Cell(1, 1)
               .SetBold()
               .SetBorder(null)
               .SetHorizontalAlignment(iText.Layout.Properties.HorizontalAlignment.LEFT)
               .SetVerticalAlignment(iText.Layout.Properties.VerticalAlignment.BOTTOM)
               .SetFont(ItalicTNR)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell cell241 = new Cell(1, 1)
               .SetBorder(null)
               .SetFont(ItalicTNR)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell cell212 = new Cell(1, 1)
               .SetBorderBottom(null)
               .SetFont(TNR)
               .SetWidth(90)
               .Add(new iText.Layout.Element.Paragraph(""));


            Cell cell222 = new Cell(1,1)
                .SetBorder(null)
              .SetFont(TNR)
              .Add(new iText.Layout.Element.Paragraph("Фамилия"));

            Cell cell232 = new Cell(1, 1)
               .SetBorderTop(null)
               .SetBorderLeft(null)
               .SetBorderRight(null)
               .SetHorizontalAlignment(iText.Layout.Properties.HorizontalAlignment.LEFT)
               .SetVerticalAlignment(iText.Layout.Properties.VerticalAlignment.BOTTOM)
               .SetFont(BoldTNR)
               
               .Add(new iText.Layout.Element.Paragraph(Familia.Text)); // здесь будет переменная с фамилией


            Cell cell242 = new Cell(1, 1)
               .SetBorder(null)
               .SetFont(ItalicTNR)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell cell213 = new Cell(1, 1)
                .SetBorderTop(null)
                .SetBorderBottom(null)
               .SetWidth(90)
               .SetFont(ItalicTNR)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell cell223 = new Cell(1, 1)
               .SetBorder(null)
               .SetFont(TNR)
               .Add(new iText.Layout.Element.Paragraph("Имя"));

            Cell cell233 = new Cell(1, 1)
                .SetBorderTop(null)
               .SetBorderLeft(null)
               .SetBorderRight(null)
                .SetHorizontalAlignment(iText.Layout.Properties.HorizontalAlignment.LEFT)
               .SetVerticalAlignment(iText.Layout.Properties.VerticalAlignment.BOTTOM)
               
               .SetFont(BoldTNR)
              
               .Add(new iText.Layout.Element.Paragraph(Imya.Text)); // здесь будет переменная с именем


            Cell cell243 = new Cell(1, 1)
               .SetBorder(null)
               .SetFont(ItalicTNR)
               .Add(new iText.Layout.Element.Paragraph("М"));

            Cell cell214 = new Cell(1, 1)
              .SetBorderTop(null)
              .SetWidth(90)
              .SetFont(ItalicTNR)
              .Add(new iText.Layout.Element.Paragraph(""));

            Cell cell224 = new Cell(1, 1)
               .SetBorder(null)
               .SetFont(TNR)
               .Add(new iText.Layout.Element.Paragraph("Отчество"));

            Cell cell234 = new Cell(1, 1)
               .SetBorderTop(null)
               .SetBorderLeft(null)
               .SetBorderRight(null)
               .SetHorizontalAlignment(iText.Layout.Properties.HorizontalAlignment.LEFT)
               .SetVerticalAlignment(iText.Layout.Properties.VerticalAlignment.BOTTOM)
               .SetFont(BoldTNR)
               .Add(new iText.Layout.Element.Paragraph(Otch.Text)); // Здесь будет переменная с отчеством

            Cell cell244 = new Cell(1, 1)
               .SetBorder(null)
               .SetFont(ItalicTNR)
               .Add(new iText.Layout.Element.Paragraph("Ж"));

            
            Cell cell215 = new Cell(1, 1)

               .SetWidth(130)
               .SetBorder(null)
               .SetFont(ItalicTNR)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell cell225 = new Cell(1, 1)
                .SetBorder(null)
                .SetFont(ItalicTNR)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell cell235 = new Cell(1, 1)
                .SetBorder(null)
               .SetFont(ItalicTNR)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell cell245 = new Cell(1, 1)
                .SetBorder(null)
               .SetFont(ItalicTNR)
               .Add(new iText.Layout.Element.Paragraph(""));

            iText.Layout.Element.Table generalinfoTable = new iText.Layout.Element.Table(2, false)
                .SetWidth(525);

            Cell geninf11 = new Cell(1, 1)
                .SetBorder(null)
               .SetWidth(20)
               .SetFont(TNR)
               .SetPaddingTop(-30)
               .SetFontSize(12)
               .Add(new iText.Layout.Element.Paragraph("1. "));

            Cell geninf12 = new Cell(1, 1)
               .SetBorderLeft(null)
               .SetBorderRight(null)
               .SetBorderTop(null)
               .SetFont(TNR)
               .SetPaddingTop(-30)
               .SetFontSize(12)
               .Add(new iText.Layout.Element.Paragraph("Число, месяц, год рождения – " + BirthDate.Text)); // тут должна быть переменная с датой рождения 

            Cell geninf13 = new Cell(1, 1)
                .SetBorder(null)
                .SetWidth(20)
               .SetFont(TNR)
               .SetFontSize(12)
               .Add(new iText.Layout.Element.Paragraph("2. "));

            Cell geninf14 = new Cell(1, 1)
                .SetBorderLeft(null)
               .SetBorderRight(null)
               .SetBorderBottom(null)
               .SetFont(TNR)
               .SetFontSize(12)
               .Add(new iText.Layout.Element.Paragraph("Место рождения – " + BirthPlace.Text)); // тут должна быть переменная с местом рождения
                                                                                                                       // 

            Cell geninf15 = new Cell(1, 1)
                .SetBorder(null)
                .SetWidth(20)
               .SetFont(TNR)
               .SetFontSize(12)
               .SetHeight(10)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell geninf16 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetBorderBottom(null)
                .SetFont(TNR)
                .SetHeight(10)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph(""));

            Cell geninf17 = new Cell(1, 1)
                .SetBorder(null)
                .SetWidth(20)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph("3. "));

            Cell geninf18 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetBorderBottom(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph("Гражданство – " + TxbNationality.Text));

            Cell geninf19 = new Cell(1, 1)
                .SetBorder(null)
                .SetWidth(20)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph("4. "));

            Cell geninf110 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph("Адрес постоянной регистрации – " + RegistrationtAddress.Text));

            Cell geninf111 = new Cell(1, 1)
                .SetBorder(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .SetHeight(10)
                .Add(new iText.Layout.Element.Paragraph(""));

            Cell geninf112 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetHeight(10)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph(""));

            Cell geninf113 = new Cell(1, 1)
                .SetBorder(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph("5. "));

            Cell geninf114 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph("Адрес фактического проживания – " + ActualAddress.Text));

            Cell geninf115 = new Cell(1, 1)
                .SetBorder(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .SetHeight(10)
                .Add(new iText.Layout.Element.Paragraph(""));

            Cell geninf116 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetFont(TNR)
                .SetHeight(10)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph(""));

            Cell geninf117 = new Cell(1, 1)
                .SetBorder(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph("6. "));

            Cell geninf118 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph("Образование до поступления в образовательное учреждение – " + Education.Text));
            Cell geninf119 = new Cell(1, 1)
                .SetBorder(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .SetHeight(10)
                .Add(new iText.Layout.Element.Paragraph(""));

            Cell geninf120 = new Cell(1, 1)

                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .SetHeight(10)
                .Add(new iText.Layout.Element.Paragraph(""));
            Cell geninf121 = new Cell(1, 1)
                .SetBorder(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph(""));

            Cell geninf122 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                .Add(new iText.Layout.Element.Paragraph("(наименование школы, класс, дата окончания)"));
            Cell geninf123 = new Cell(1, 1)
                .SetBorder(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph("7. "));

            Cell geninf124 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph("Дополнительные сведения - "));
            Cell geninf125 = new Cell(1, 1)
                .SetBorder(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph(""));

            Cell geninf126 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null) 
                .SetHeight(10)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph(""));
            
            Cell geninf127 = new Cell(1, 1)
                .SetBorder(null)
                .SetHeight(10)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph(""));

            Cell geninf128 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetHeight(10)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph(""));
            Cell geninf129 = new Cell(1, 1)
                .SetBorder(null)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph(""));

            Cell geninf130 = new Cell(1, 1)
                .SetBorderLeft(null)
                .SetBorderRight(null)
                .SetBorderBottom(null)
                .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                .SetFont(TNR)
                .SetFontSize(12)
                .Add(new iText.Layout.Element.Paragraph("(владение иностранным языком, музыкальное образование, спортивные разряды и т.д.)"));

           



            /*  
              doc.Add(new iText.Layout.Element.Paragraph(txbFio.Text).AddStyle(style));
              doc.Add(new iText.Layout.Element.Paragraph(txbAge.Text).AddStyle(style2));
              doc.Add(new iText.Layout.Element.Paragraph("____________________" + txbStipendSize.Text + "______________________").AddStyle(style3));
  */


            table.AddCell(cell11);
            table.AddCell(cell12);
            table.AddCell(cell21);
            table.AddCell(cell22);
            table.AddCell(cell31);
            table.AddCell(cell32);
            table2.AddCell(cell211);
            table2.AddCell(cell221);
            table2.AddCell(cell231);
            table2.AddCell(cell241);
            table2.AddCell(cell212);
            table2.AddCell(cell222);
            table2.AddCell(cell232);
            table2.AddCell(cell242);
            table2.AddCell(cell213);
            table2.AddCell(cell223);
            table2.AddCell(cell233);
            table2.AddCell(cell243);
            table2.AddCell(cell214);
            table2.AddCell(cell224);
            table2.AddCell(cell234);
            table2.AddCell(cell244);
            table2.AddCell(cell215);
            table2.AddCell(cell225);
            table2.AddCell(cell235);
            table2.AddCell(cell245);


            doc.Add(table);
            doc.Add(table2);

            // Styles
            // Style
            // Стиль
            // Стили

            var style = new iText.Layout.Style() 
                 .SetFontSize(12)
                 .SetTextAlignment(iText.Layout.Properties.TextAlignment.LEFT)
                 .SetFont(TNR)
                 .SetFontColor(new DeviceRgb(0, 0, 0));
            var style2 = new iText.Layout.Style()
                  .SetFontSize(12)
                  .SetFont(BoldTNR)
                  .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                  .SetPaddingBottom(25)
                  .SetFontColor(new DeviceRgb(0, 0, 0));

            var style3 = new iText.Layout.Style()
                 .SetFontSize(12)
                 .SetPaddingTop(-15)
                 .SetTextAlignment(iText.Layout.Properties.TextAlignment.LEFT)
                 .SetFont(TNR)
                 .SetFontColor(new DeviceRgb(0, 0, 0));

            doc.Add(new iText.Layout.Element.Paragraph("Зачислен(а) на __1__ курс, группа №" +Group.Text + "    Приказ № _____ от ____").AddStyle(style)); // Здесь должна быть переменная с группой и датой зачисления !!!!!!!!!!!
            doc.Add(new iText.Layout.Element.Paragraph("1. ОБЩИЕ СВЕДЕНИЯ").AddStyle(style2));

            generalinfoTable.AddCell(geninf11);
            generalinfoTable.AddCell(geninf12);
            generalinfoTable.AddCell(geninf13);
            generalinfoTable.AddCell(geninf14);
            generalinfoTable.AddCell(geninf15);
            generalinfoTable.AddCell(geninf16);
            generalinfoTable.AddCell(geninf17);
            generalinfoTable.AddCell(geninf18);
            generalinfoTable.AddCell(geninf19);
            generalinfoTable.AddCell(geninf110);
            generalinfoTable.AddCell(geninf111);
            generalinfoTable.AddCell(geninf112);
            generalinfoTable.AddCell(geninf113);
            generalinfoTable.AddCell(geninf114);
            generalinfoTable.AddCell(geninf115);
            generalinfoTable.AddCell(geninf116);
            generalinfoTable.AddCell(geninf117);
            generalinfoTable.AddCell(geninf118);
            generalinfoTable.AddCell(geninf119);
            generalinfoTable.AddCell(geninf120);
            generalinfoTable.AddCell(geninf121);
            generalinfoTable.AddCell(geninf122);
            generalinfoTable.AddCell(geninf123);
            generalinfoTable.AddCell(geninf124);
            generalinfoTable.AddCell(geninf125);
            generalinfoTable.AddCell(geninf126);
            generalinfoTable.AddCell(geninf127);
            generalinfoTable.AddCell(geninf128);
            generalinfoTable.AddCell(geninf129);
            generalinfoTable.AddCell(geninf130);


            


            doc.Add(generalinfoTable);
            iText.Layout.Element.Table parentsinfotable = new iText.Layout.Element.Table(3, false)
                .SetWidth(525);

            Cell parentstb1 = new Cell(1, 1)               
               .SetFont(ItalicTNR)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetWidth(150)
               .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
               .SetHeight(15)
               .Add(new iText.Layout.Element.Paragraph("Данные"));

            Cell parentstb2 = new Cell(1, 1)
               .SetFont(ItalicTNR)
               .SetPaddingTop(0)
               .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
               .SetFontSize(10)
               .SetHeight(15)
               .Add(new iText.Layout.Element.Paragraph("Мать"));

            Cell parentstb3 = new Cell(1, 1)
               .SetFont(ItalicTNR)
               .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
               .Add(new iText.Layout.Element.Paragraph("Отец"));

            Cell parentstb4 = new Cell(1, 1)
              .SetFont(TNR)
              .SetBorderBottom(null)
              .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
              .Add(new iText.Layout.Element.Paragraph(""));

            Cell parentstb5 = new Cell(1, 1)
               .SetFont(TNR)

               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
               .Add(new iText.Layout.Element.Paragraph(MotherFio.Text));

            Cell parentstb6 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
               .SetMinWidth(150)
               .Add(new iText.Layout.Element.Paragraph(FatherFio.Text));

            Cell parentstb7 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetBorderBottom(null)
               .SetBorderTop(null)
               .SetFontSize(10)
               .SetHeight(15)
               .Add(new iText.Layout.Element.Paragraph("Ф.И.О."));
            Cell parentstb8 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
               .Add(new iText.Layout.Element.Paragraph(""));
            Cell parentstb9 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell parentstb10 = new Cell(1, 1)
              .SetFont(TNR)
              .SetBorderTop(null)
              .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
              .Add(new iText.Layout.Element.Paragraph(""));
            Cell parentstb11 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
               .Add(new iText.Layout.Element.Paragraph(""));
            Cell parentstb12 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
               .Add(new iText.Layout.Element.Paragraph(""));

            Cell parentstb13 = new Cell(1, 1)
              .SetFont(TNR)
              .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
              .Add(new iText.Layout.Element.Paragraph("Дом. адрес, тел."));
            Cell parentstb14 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(8)
               .SetMinWidth(150)
               .Add(new iText.Layout.Element.Paragraph(MotherAdress.Text + "Тел.:" + MotherTelepthone.Text));
            Cell parentstb15 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(8)
               .SetMinWidth(150)
               .Add(new iText.Layout.Element.Paragraph(FatherAdress.Text + "Тел.:" + FatherTelepthone.Text ));

            Cell parentstb16 = new Cell(1, 1)
              .SetFont(TNR)
              .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
              .Add(new iText.Layout.Element.Paragraph("Место работы, рабочий тел."));
            Cell parentstb17 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
               .SetMinWidth(150)
               .Add(new iText.Layout.Element.Paragraph(MotherJobPlace.Text));
            Cell parentstb18 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
               .SetMinWidth(150)
               .Add(new iText.Layout.Element.Paragraph(FatherJobPlace.Text));

            Cell parentstb19 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
              .Add(new iText.Layout.Element.Paragraph("Должность "));
            Cell parentstb20 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
               .SetMinWidth(150)
               .Add(new iText.Layout.Element.Paragraph(MotherJobPosition.Text)); // переменная с данными через + {doljnosttextbox.Text}
            Cell parentstb21 = new Cell(1, 1)
               .SetFont(TNR)
               .SetPaddingTop(0)
               .SetFontSize(10)
               .SetHeight(15)
               .SetMinWidth(150)
               .Add(new iText.Layout.Element.Paragraph(FatherJobPosition.Text));

                       
            parentsinfotable.AddCell(parentstb1);
            parentsinfotable.AddCell(parentstb2);
            parentsinfotable.AddCell(parentstb3);
            parentsinfotable.AddCell(parentstb4);
            parentsinfotable.AddCell(parentstb5);
            parentsinfotable.AddCell(parentstb6);
            parentsinfotable.AddCell(parentstb7);
            parentsinfotable.AddCell(parentstb8);
            parentsinfotable.AddCell(parentstb9);
            parentsinfotable.AddCell(parentstb10);
            parentsinfotable.AddCell(parentstb11);
            parentsinfotable.AddCell(parentstb12);
            parentsinfotable.AddCell(parentstb13);
            parentsinfotable.AddCell(parentstb14);
            parentsinfotable.AddCell(parentstb15);
            parentsinfotable.AddCell(parentstb16);
            parentsinfotable.AddCell(parentstb17);
            parentsinfotable.AddCell(parentstb18);
            parentsinfotable.AddCell(parentstb19);
            parentsinfotable.AddCell(parentstb20);
            parentsinfotable.AddCell(parentstb21);

            

            doc.Add(new iText.Layout.Element.Paragraph("8.Сведения о родителях:").AddStyle(style3));

            doc.Add(parentsinfotable);
            docPdf.Close();
        }
    }
}
