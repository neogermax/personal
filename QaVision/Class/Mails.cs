using System;
using System.Collections.Generic;
using System.Net.Mail;

public class Mails
{

    #region "Procesos Globales"
    /*INSTANCIA DE OLECONEXION GLOBALES*/
    C_Conexion vg_ConexionClass = new C_Conexion();
#endregion

    /// <summary>
    /// construye correo
    /// </summary>
    /// <param name="vp_DPrincipal"></param>
    /// <param name="vp_DCopia"></param>
    /// <param name="vp_DOculto"></param>
    /// <param name="vp_Asunto"></param>
    /// <param name="vp_Body"></param>
    /// <param name="vp_Adjunto"></param>
    /// <returns></returns>
    public string SendMail(string vp_DPrincipal, string vp_DCopia, string vp_DOculto, string vp_Asunto, string vp_Body, string vp_Adjunto, string vp_CampanaId)
    {
        C_CorreoCampana correoCampana = new C_CorreoCampana();
        List<C_CorreoCampana> ObjList = new List<C_CorreoCampana>();
        
        correoCampana.CampanaId = Convert.ToInt64(vp_CampanaId);
        ObjList = correoCampana.Read_DatosCorreo(correoCampana);


        MailMessage Obj_Correo = new MailMessage();

        //Generar las partes del correo
        Obj_Correo.From = new MailAddress(ObjList[0].EMAIL_FROM);
        Obj_Correo.To.Add(vp_DPrincipal);
        //validamos si viene destinatario copia
        if (vp_DCopia != "") { Obj_Correo.CC.Add(vp_DCopia); }
        //validamos si viene destinatario oculto
        if (vp_DOculto != "") { Obj_Correo.Bcc.Add(vp_DOculto); }
        Obj_Correo.Subject = vp_Asunto;
        Obj_Correo.Body = vp_Body;
        Obj_Correo.IsBodyHtml = true;
        Obj_Correo.Priority = MailPriority.Normal;


        //validar si exixte documento adjunto 
        if (vp_Adjunto != "")
        {
            String[] Obj_Adjunto;
            //convertimos el string en un array de datos 
            Obj_Adjunto = vp_Adjunto.Split(',');
            int vl_Cont = 0;

            foreach (string row in Obj_Adjunto)
            {
                System.Net.Mail.Attachment Adjunto = new System.Net.Mail.Attachment(Obj_Adjunto[vl_Cont], System.Net.Mime.MediaTypeNames.Application.Octet);
                Obj_Correo.Attachments.Add(Adjunto);
                vl_Cont = vl_Cont + 1;
            }
        }

        try
        {
            //Declarar el servidor SMTP
            SmtpClient Obj_Smtp = new SmtpClient();
            Obj_Smtp.Host = ObjList[0].SMTP;
            Obj_Smtp.Port = 587;
            Obj_Smtp.EnableSsl = true;

            //Declarar credenciales de acceso
            Obj_Smtp.Credentials = new System.Net.NetworkCredential(ObjList[0].EMAIL_CONFIG, ObjList[0].EMAIL_PASS);
            //Enviar el mensaje
            Obj_Smtp.Send(Obj_Correo);

            return "Ok";
        }

        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }

    }

    private string Replace(string archivo, string p, int p_2)
    {
        throw new NotImplementedException();
    }

}
