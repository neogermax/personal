using System;
using System.IO;
using System.Web;

public class C_Files
{
    #region "FUNCIONES DE SERVIDOR"
    /// <summary>
    /// CARGA ARCHIVOS AL SERVIDOR
    /// </summary>
    /// <param name="vp_H_files"></param>
    /// <param name="vp_S_Ruta"></param>
    /// <param name="vl_S_NombreDoc"></param>
    /// <returns></returns>
    public string Upload_File(HttpFileCollection vp_H_files, string vp_S_Ruta, string vl_S_Nombre)
    {
        string DocVal = "";
        string[] strFileName;
        string fileName = String.Empty;

        //Se recorre la lista de archivos cargados al servidor
        for (int i = 0; i <= vp_H_files.Count - 1; i++)
        {

            HttpPostedFile vl_File = vp_H_files[i];
            if (vl_File.ContentLength > 0)
            {

                strFileName = vl_File.FileName.Split(@"\".ToCharArray());
                //captura Nombre
                fileName = strFileName[strFileName.Length - 1];

                string vl_fullPath = HttpContext.Current.Request.PhysicalApplicationPath + vp_S_Ruta;
                //determinanado la ruta destino
                string sFullPath = vl_fullPath + vl_S_Nombre;

               //String  vl_result =  File.Exists(sFullPath) ? "1" : "0";

                //Subiendo el archivo al server
                vl_File.SaveAs(sFullPath);
                DocVal = fileName;

            }
        }
        return DocVal;
    }

    /// <summary>
    /// ELIMINA ARCHIVO 
    /// </summary>
    /// <param name="vp_S_RutaOrigen"></param>
    /// <param name="vp_S_archivo"></param>
    /// <returns></returns>
    public int Delete_File(string vp_S_RutaOrigen, string vp_S_archivo)
    {
        int Valida_Borrado = 1;
        string vl_fullPath = HttpContext.Current.Request.PhysicalApplicationPath + vp_S_RutaOrigen;
        string FileToErase = vl_fullPath + vp_S_archivo;

        try
        {
            if (System.IO.File.Exists(FileToErase) == true)
            {
                System.IO.File.Delete(FileToErase);
                Valida_Borrado = 0;
            }

        }
        catch (Exception)
        {
            Valida_Borrado = 1;
        }
        return Valida_Borrado;
    }

    /// <summary>
    /// COPIA LOS ARCHIVOS DE UNA CARPETA A OTRA
    /// </summary>
    /// <param name="vp_S_RutaOrigen"></param>
    /// <param name="vp_S_RutaDestino"></param>
    /// <param name="vp_S_archivo"></param>
    /// <returns></returns>
    public int Copy_File(string vp_S_RutaOrigen, string vp_S_RutaDestino, string vp_S_archivo)
    {
        int Valida_Copia = 1;
        string vl_fullPath_Temporal = HttpContext.Current.Request.PhysicalApplicationPath + vp_S_RutaOrigen;
        string vl_fullPath_Destino = HttpContext.Current.Request.PhysicalApplicationPath + vp_S_RutaDestino;

        string FileToCopy = vl_fullPath_Temporal + vp_S_archivo;
        string NewCopy = vl_fullPath_Destino + vp_S_archivo;

        try
        {
            //confirmamos de que el destino existe.
            if (System.IO.File.Exists(vl_fullPath_Destino) == true) { System.IO.File.Delete(vl_fullPath_Destino); }
            if (System.IO.File.Exists(FileToCopy) == true)
            {
                System.IO.File.Copy(FileToCopy, NewCopy);
                Valida_Copia = 0;
            }
        }
        catch (Exception)
        {
            Valida_Copia = 1;
        }

        return Valida_Copia;
    }

    /// <summary>
    /// RENOMBRA ARCHIVO SELECCIONADO
    /// </summary>
    /// <param name="vp_S_RutaOrigen"></param>
    /// <param name="vp_S_NewName"></param>
    /// <param name="vp_S_OldName"></param>
    /// <returns></returns>
    public int Rename_File(string vp_S_RutaOrigen, string vp_S_NewName, string vp_S_OldName)
    {
        string vl_fullPath = HttpContext.Current.Request.PhysicalApplicationPath + vp_S_RutaOrigen;

        int vl_Valida_Rename;
        string OldName = vl_fullPath + vp_S_OldName;
        string NewName = vl_fullPath + vp_S_NewName;

        try
        {
            File.Move(OldName, NewName);
            vl_Valida_Rename = 0;
        }
        catch (Exception)
        {
            vl_Valida_Rename = 1;
        }

        return vl_Valida_Rename;
    }
    #endregion

}
