using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Objects;

namespace DAL
{
    public class UsuarioDAL: Abstract_Crud<Usuario>
    {
        public List<int> lstGrupos { get; set; }

        public override void Add()
        {
            foreach (int i in lstGrupos)
            {
                Grupo gr = contexto.Grupo.FirstOrDefault(it => it.Id_grupo == i);
                ObjEF.Grupos.Add(gr);
            }
            base.Add();
        }

        public override void Delete()
        {
            ObjectStateManager objState = contexto.ObjectStateManager;
            Grupo[] ar = ObjEF.Grupos.ToArray();
            for (int i = 0; i < ar.Count(); i++)
                objState.ChangeRelationshipState(ObjEF, ar[i], it => it.Grupos, System.Data.EntityState.Deleted);
            base.Delete();
        }

        public override void Update()
        {
            ObjectStateManager objState = contexto.ObjectStateManager;

            var lst = ObjEF.Grupos.Select(it => it.Id_grupo).ToList();
            foreach (int i in lst.Except(lstGrupos))
            {
                Grupo gr = ObjEF.Grupos.First(it => it.Id_grupo == i);
                objState.ChangeRelationshipState(ObjEF, gr, it => it.Grupos, System.Data.EntityState.Deleted);
            }

            foreach (int i in lstGrupos.Except(lst))
            {
                Grupo gr = contexto.Grupo.FirstOrDefault(it => it.Id_grupo == i);
                ObjEF.Grupos.Add(gr);
            }

            base.Update();
        }


    }
}
