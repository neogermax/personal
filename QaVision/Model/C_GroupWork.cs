using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Web;

public class C_GroupWork
{
    #region "Objetos Publicos"
    public long Id { get; set; }
    public long CampanaId { get; set; }
    public long UsuarioId { get; set; }
    public long CoordinadorId { get; set; }
    public long ValueRolId { get; set; }

    public string Campana { get; set; }
    public string Usuario { get; set; }
    public string Coordinador { get; set; }
    public string Rol { get; set; }

    public string Respuesta { get; set; }
    #endregion

    #region "Procesos Globales"
    C_Conexion vg_ConexionClass = new C_Conexion();
    #endregion

    #region "CRUD"
    /// <summary>
    /// Crea el usuario en base de datos (CREATE)
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Create_GrupoTrabajo(C_GroupWork Obj)
    {

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'INSERT' ,'0','" +
                                                                             Obj.CampanaId + "','" +
                                                                             Obj.CoordinadorId + "','" +
                                                                             Obj.UsuarioId + "','" +
                                                                              Obj.ValueRolId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }

    /// <summary>
    /// actualiza el coordinador al agente
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public string Update_GrupoTrabajo(C_GroupWork Obj)
    {
        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'UPDATE_COORDINADOR' ,'" + Obj.Id + "','" + Obj.CoordinadorId + "'");
        string vl_StrQuery = vl_Sql.ToString();

        string vl_Status = vg_ConexionClass.Search_Date(vl_StrQuery, "STD");
        int valor;

        string vl_index = (int.TryParse(vl_Status, out valor)) ? vl_Status : vl_Status;
        return vl_index;
    }


    /// <summary>
    ///  trae la lista de personal de la campaña seleccionada
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_GroupWork> Read_Personal(C_GroupWork Obj)
    {
        List<C_GroupWork> vl_ObjList = new List<C_GroupWork>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'READ_PERSONAL_CAMPANA','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_PERSONAL", "STD");

        return vl_ObjList;
    }

    /// <summary>
    ///  trae la lista de agentes de la campaña seleccionada
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_GroupWork> Read_AgentesAll(C_GroupWork Obj)
    {
        List<C_GroupWork> vl_ObjList = new List<C_GroupWork>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'READALL_AGENTES_CAMPANA','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_AGENTES_VER", "STD");

        return vl_ObjList;
    }

    /// <summary>
    /// Trae los agentes nesesacios para la asignacion
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_GroupWork> Read_AgentesSinAsig(C_GroupWork Obj)
    {
        List<C_GroupWork> vl_ObjList = new List<C_GroupWork>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'READ_AGENTES_SIN_CAMPANA','" + Obj.Id + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_PERSONAL", "STD");

        return vl_ObjList;
    }

    /// <summary>
    /// Trae los agentes nesesacios para la asignacion
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_GroupWork> Read_AgentesCoordinador(C_GroupWork Obj)
    {
        List<C_GroupWork> vl_ObjList = new List<C_GroupWork>();

        StringBuilder vl_Sql = new StringBuilder();
        vl_Sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'READ_AGENTES_COORDINADOR','" + Obj.Id + "','" + Obj.Respuesta + "'");
        string vl_StrQuery = vl_Sql.ToString();

        vl_ObjList = List(vl_StrQuery, "READ_PERSONAL", "STD");

        return vl_ObjList;
    }

    /// <summary>
    /// TRAE EL COORDINADOR DEL AGENTE SELECCIONADO
    /// </summary>
    /// <param name="Obj"></param>
    /// <returns></returns>
    public List<C_GroupWork> Read_CoordinatorAsigAgent(C_GroupWork Obj)
    {
        List<C_GroupWork> ObjList = new List<C_GroupWork>();
        StringBuilder vl_sql = new StringBuilder();

        vl_sql.Append("SET DATEFORMAT ymd EXEC [Proceso].[SP_CRUD_GRUPOSTRABAJO] 'SELECT_COORDINADOR','" + Obj.UsuarioId + "','" + Obj.CampanaId + "'");

        string vl_StrQuery = vl_sql.ToString();
        ObjList = List(vl_StrQuery, "USER_COORDINATOR", "STD");

        return ObjList;
    }

    #endregion


    #region "LISTAS"
    /// <summary>
    /// CREA LISTADO DE CONSULTA USER
    /// </summary>
    /// <param name="vp_Query"></param>
    /// <param name="vp_Type"></param>
    /// <returns></returns>
    public List<C_GroupWork> List(string vp_Query, string vp_Type, string vp_BD)
    {
        List<C_GroupWork> vl_ObjList = new List<C_GroupWork>();
        string vl_Conexion = vg_ConexionClass.Construye_Conexion(vp_BD);
        OleDbDataReader Read_Query = vg_ConexionClass.OpenConexion(vp_Query, 1);

        switch (vp_Type)
        {

            case "READ_PERSONAL":
                while (Read_Query.Read())
                {
                    C_GroupWork Obj = new C_GroupWork
                    {
                        Id = Convert.ToInt64(Read_Query["Id"]),
                        Usuario = Read_Query["Nombre"].ToString(),
                        Rol = Read_Query["Perfil"].ToString(),
                        ValueRolId = Convert.ToInt64(Read_Query["RolId"]),
                    };
                    vl_ObjList.Add(Obj);
                }
                break;

            case "READ_AGENTES_VER":
                while (Read_Query.Read())
                {
                    C_GroupWork Obj = new C_GroupWork
                    {
                        CoordinadorId = Convert.ToInt64(Read_Query["CoordinadorId"]),
                        Coordinador = Read_Query["Coordinador"].ToString(),
                        Id = Convert.ToInt64(Read_Query["Id"]),
                        Usuario = Read_Query["Agente"].ToString(),
                        ValueRolId = Convert.ToInt64(Read_Query["RolId"]),
                        Rol = Read_Query["Perfil"].ToString(),
                    };
                    vl_ObjList.Add(Obj);
                }
                break;

            case "USER_COORDINATOR":
                while (Read_Query.Read())
                {
                    C_GroupWork Obj = new C_GroupWork();

                    Obj.CoordinadorId = Convert.ToInt64(Read_Query["CoordinadorId"]);
                    Obj.Coordinador = Read_Query["Coordinador"].ToString();

                    vl_ObjList.Add(Obj);
                }

                break;

        }

        vg_ConexionClass.CloseConexion();
        return vl_ObjList;
    }
    #endregion

}
