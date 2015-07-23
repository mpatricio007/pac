using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Medusa.Classes
{
    public class Util
    {
        public static string DateToString(DateTime? date)
        {
            return (!date.HasValue) || date == DateTime.MinValue ? String.Empty : date.GetValueOrDefault().ToShortDateString();
        }

        public static string DateToString(DateTime date)
        {
            return (date == DateTime.MinValue) ? String.Empty : date.ToShortDateString();
        }


        public static DateTime StringToDate(string strData)
        {   
            DateTime dtOut;
            DateTime.TryParse(strData, out dtOut);
            return dtOut;
        }

        public static void LoadDropDownList(DropDownList ddl, string strText,string strValue,IQueryable ds)
        {
            ddl.DataTextField = strText;
            ddl.DataValueField = strValue;
            ddl.DataSource = ds;
            ddl.DataBind();
        }
    }
}