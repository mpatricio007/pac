using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class EstadosDAL:Abstract_Crud<Estados>
    {
        public IQueryable ListaEstados()
        {
            return from estado in GetAll()
                   select estado.uf;
        }
    }
}
