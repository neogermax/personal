using System;
using System.Collections.Generic;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Newtonsoft.Json.Linq;

public class PDF
{
    #region "Documento PDF"
    public string Titulo { get; set; }
    public string RutaDocumento { get; set; }
    public string RutaLogo { get; set; }
    public string Logo { get; set; }
    public string TipoDocumento { get; set; }

    public string Respuesta { get; set; }

    #endregion

    #region "Historico Contraseña"
    public string NombreCompleto { get; set; }
    public string Documento { get; set; }
    public string ListHistory { get; set; }
    #endregion

    /// <summary>
    /// creacion de documento de levantamiento en pdf 
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Pdf_HistoricoContrasena(PDF Obj)
    {
        try
        {
            string vl_NamePDF = "\\" + TipoDocumento + "_" + Obj.Documento + ".pdf";

            // Creamos el documento con el tamaño de página tradicional
            Document doc = new Document(PageSize.LETTER);
            // Indicamos donde vamos a guardar el documento
            PdfWriter writer = PdfWriter.GetInstance(doc,
                                        new FileStream(Obj.RutaDocumento + vl_NamePDF, FileMode.Create));

            // Le colocamos el título y el autor
            // **Nota: Esto no será visible en el documento
            doc.AddTitle("Historico de contraseñas");
            doc.AddCreator("SOME 2021");

            // Abrimos el archivo
            doc.Open();

            // Creamos el tipo de Font que vamos utilizar
            iTextSharp.text.Font TitleFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 12, iTextSharp.text.Font.BOLD, BaseColor.BLACK);
            iTextSharp.text.Font TitleSecondFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 10, iTextSharp.text.Font.BOLD, BaseColor.BLACK);
            iTextSharp.text.Font TitleSecondItalicFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 10, iTextSharp.text.Font.BOLDITALIC, BaseColor.BLACK);
            iTextSharp.text.Font StandarFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
            iTextSharp.text.Font PiePaginaFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 10, iTextSharp.text.Font.BOLDITALIC, BaseColor.GRAY);

            // Creamos una tabla que CONTIENE EL ENCABEZADO DEL DOCUMENTO
            PdfPTable tblEncabezado = new PdfPTable(5);
            tblEncabezado.WidthPercentage = 100;

            #region "Encabezado"
            //IMAGEN
            Image vl_Logo = Image.GetInstance(Obj.RutaLogo + "/" + Obj.Logo);
            vl_Logo.ScaleAbsolute(145f, 68f);

            PdfPCell clImagen = new PdfPCell(vl_Logo);
            clImagen.Colspan = 1;
            clImagen.BorderWidth = 0;
            clImagen.Rowspan = 4;
            clImagen.HorizontalAlignment = 1; //0=Izquierda, 1=Centro,   2 = Derecha
            clImagen.VerticalAlignment = Element.ALIGN_MIDDLE;
            tblEncabezado.AddCell(clImagen);
            //TITULO DOCUMENTO
            PdfPCell clTitulo = new PdfPCell(new Phrase(Titulo, TitleFont));
            clTitulo.BorderWidth = 0;
            /* clTitulo.BorderWidthTop = 0.75f;*/
            clTitulo.Colspan = 3;
            clTitulo.HorizontalAlignment = 1; //0=Izquierda, 1=Centro,   2 = Derecha
            tblEncabezado.AddCell(clTitulo);
            //POLITICA DEL DOCUMENTO
            PdfPCell clFPolitica = new PdfPCell(new Phrase("DOCUMENTO PRIVADO", TitleFont));
            clFPolitica.Colspan = 1;
            clFPolitica.BorderWidth = 0;
            clFPolitica.Rowspan = 4;
            clFPolitica.HorizontalAlignment = 1; //0=Izquierda, 1=Centro,   2 = Derecha
            clFPolitica.VerticalAlignment = Element.ALIGN_MIDDLE;
            tblEncabezado.AddCell(clFPolitica);
            //ESTADO DEL DOCUMENTO
            PdfPCell clFormato = new PdfPCell(new Phrase("CERRADO", TitleFont));
            clFormato.BorderWidth = 0;
            clFormato.Colspan = 3;
            clFormato.HorizontalAlignment = 1; //0=Izquierda, 1=Centro,   2 = Derecha
            tblEncabezado.AddCell(clFormato);
            //FECHA DE IMPRESION DEL DOCUMENTO
            DateTime vl_Day = DateTime.Today;
            PdfPCell clFfecha = new PdfPCell(new Phrase(vl_Day.ToString("yyyy-MM-dd"), TitleFont));
            clFfecha.BorderWidth = 0;
            /* clFfecha.BorderWidthBottom = 0.75f;*/
            clFfecha.Colspan = 3;
            clFfecha.HorizontalAlignment = 1; //0=Izquierda, 1=Centro,   2 = Derecha
            tblEncabezado.AddCell(clFfecha);

            // Finalmente, añadimos la tabla al documento PDF y cerramos el documento
            doc.Add(tblEncabezado);
            #endregion

            #region "Nombre y documento"
            // Creamos una tabla que CONTIENE EL ENCABEZADO DEL DOCUMENTO
            PdfPTable tblData4 = new PdfPTable(4);
            tblData4.WidthPercentage = 100;

            PdfPCell clTittle4 = new PdfPCell(new Phrase("Nombre:", TitleSecondFont));
            clTittle4.Colspan = 1;
            clTittle4.BorderWidth = 1;
            clTittle4.BackgroundColor = new iTextSharp.text.BaseColor(215, 215, 215);
            clTittle4.HorizontalAlignment = 0; //0=Izquierda, 1=Centro,   2 = Derecha
            tblData4.AddCell(clTittle4);

            PdfPCell clData4 = new PdfPCell(new Phrase(Obj.NombreCompleto, StandarFont));
            clData4.Colspan = 1;
            clData4.BorderWidth = 1;
            clData4.HorizontalAlignment = 0; //0=Izquierda, 1=Centro,   2 = Derecha
            tblData4.AddCell(clData4);

            PdfPCell clTittle4A = new PdfPCell(new Phrase("Documento:", TitleSecondFont));
            clTittle4A.Colspan = 1;
            clTittle4A.BorderWidth = 1;
            clTittle4A.BackgroundColor = new iTextSharp.text.BaseColor(215, 215, 215);
            clTittle4A.HorizontalAlignment = 0; //0=Izquierda, 1=Centro,   2 = Derecha
            tblData4.AddCell(clTittle4A);

            PdfPCell clData4A = new PdfPCell(new Phrase(Obj.Documento, StandarFont));
            clData4A.Colspan = 1;
            clData4A.BorderWidth = 1;
            clData4A.HorizontalAlignment = 0; //0=Izquierda, 1=Centro,   2 = Derecha
            tblData4.AddCell(clData4A);

            doc.Add(tblData4);
            #endregion

            #region "Registros de cambio"

            PdfPTable tblDataHU = new PdfPTable(3);
            tblDataHU.WidthPercentage = 100;

            PdfPCell clNum = new PdfPCell(new Phrase("IP", TitleSecondFont));
            clNum.Colspan = 1;
            clNum.BorderWidth = 1;
            clNum.BackgroundColor = new iTextSharp.text.BaseColor(215, 215, 215);
            clNum.HorizontalAlignment = 1; //0=Izquierda, 1=Centro,   2 = Derecha
            tblDataHU.AddCell(clNum);

            PdfPCell clComo = new PdfPCell(new Phrase("Tipo de gestión", TitleSecondFont));
            clComo.Colspan = 1;
            clComo.BorderWidth = 1;
            clComo.BackgroundColor = new iTextSharp.text.BaseColor(215, 215, 215);
            clComo.HorizontalAlignment = 1; //0=Izquierda, 1=Centro,   2 = Derecha
            tblDataHU.AddCell(clComo);

            PdfPCell clQuiero = new PdfPCell(new Phrase("Fecha", TitleSecondFont));
            clQuiero.Colspan = 1;
            clQuiero.BorderWidth = 1;
            clQuiero.BackgroundColor = new iTextSharp.text.BaseColor(215, 215, 215);
            clQuiero.HorizontalAlignment = 1; //0=Izquierda, 1=Centro,   2 = Derecha
            tblDataHU.AddCell(clQuiero);
            doc.Add(tblDataHU);

            //aterrizamos las historias de usuario
            JArray HistoryArray = JArray.Parse(ListHistory);

            //recorremos las tareas de proceso
            foreach (var item in HistoryArray)
            {
                PdfPTable tblDataItemsHU = new PdfPTable(3);
                tblDataItemsHU.WidthPercentage = 100;

                string vl_IP = item["IP"].ToString();
                PdfPCell clComoItem = new PdfPCell(new Phrase(vl_IP, StandarFont));
                clComoItem.Colspan = 1;
                clComoItem.BorderWidth = 1;
                clComoItem.HorizontalAlignment = 1; //0=Izquierda, 1=Centro,   2 = Derecha
                tblDataItemsHU.AddCell(clComoItem);

                string vl_OpcionPassword = item["OpcionPassword"].ToString();
                PdfPCell clQuieroItem = new PdfPCell(new Phrase(vl_OpcionPassword.ToUpper(), StandarFont));
                clQuieroItem.Colspan = 1;
                clQuieroItem.BorderWidth = 1;
                clQuieroItem.HorizontalAlignment = 1; //0=Izquierda, 1=Centro,   2 = Derecha
                tblDataItemsHU.AddCell(clQuieroItem);

                string vl_FechaRegistro = item["FechaRegistro"].ToString();
                PdfPCell clPqItem = new PdfPCell(new Phrase(vl_FechaRegistro.ToUpper(), StandarFont));
                clPqItem.Colspan = 1;
                clPqItem.BorderWidth = 1;
                clPqItem.HorizontalAlignment = 1; //0=Izquierda, 1=Centro,   2 = Derecha
                tblDataItemsHU.AddCell(clPqItem);

                doc.Add(tblDataItemsHU);

            }
            #endregion

            #region "Fotter"
            int vl_Hour = DateTime.Now.Hour;
            int vl_Minutes = DateTime.Now.Minute;
            int vl_Seconds = DateTime.Now.Second;

            string vl_strHour = vl_Hour.ToString();
            string vl_strMinutes = vl_Minutes.ToString();
            string vl_strSeconds = vl_Seconds.ToString();

            vl_strHour = (vl_strHour.Length == 1) ? "0" + vl_strHour : vl_strHour;
            vl_strMinutes = (vl_strMinutes.Length == 1) ? "0" + vl_strMinutes : vl_strMinutes;
            vl_strSeconds = (vl_strSeconds.Length == 1) ? "0" + vl_strSeconds : vl_strSeconds;


            PdfPTable tblFooter = new PdfPTable(1);
            tblFooter.WidthPercentage = 100;
            tblFooter.SpacingBefore = 50f;

            PdfPCell clFooter = new PdfPCell(new Phrase("Realizado por SOME fecha de generación (" + vl_Day.ToString("yyyy-MM-dd") + " " + vl_strHour + ":" + vl_strMinutes + ":" + vl_strSeconds + ")", PiePaginaFont));
            clFooter.Colspan = 1;
            clFooter.BorderWidth = 0;
            clFooter.BorderWidthBottom = 1f;
            clFooter.BorderColor = new iTextSharp.text.BaseColor(128, 128, 128);
            clFooter.PaddingBottom = 10f;
            clFooter.HorizontalAlignment = 2; //0=Izquierda, 1=Centro,   2 = Derecha
            tblFooter.AddCell(clFooter);

            doc.Add(tblFooter);
            #endregion

            doc.Close();
            writer.Close();

            return "GENERADO";

        }
        catch (Exception error)
        {
            return error.Message.ToString();
        }
    }

}
