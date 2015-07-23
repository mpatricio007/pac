using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Objects;

namespace DAL
{
    public class GrupoDAL : Abstract_Crud<Grupo>
    {
        public List<int> lstInterfaces { get; set; }

        public override void Add()
        {
            foreach (int i in lstInterfaces)
            {
                Interface inter = contexto.Interface.FirstOrDefault(it => it.Id_interface == i);
                ObjEF.Interfaces.Add(inter);
            }
            base.Add();
        }

        public override void Delete()
        {
            ObjectStateManager objState = contexto.ObjectStateManager;
            Interface[] ar = ObjEF.Interfaces.ToArray();
            for (int i = 0; i < ar.Count(); i++)
                objState.ChangeRelationshipState(ObjEF, ar[i], it => it.Interfaces, System.Data.EntityState.Deleted);
            base.Delete();
        }

        public override void Update()
        {
            ObjectStateManager objState = contexto.ObjectStateManager;

            var lst = ObjEF.Interfaces.Select(it => it.Id_interface).ToList();
            foreach (int i in lst.Except(lstInterfaces))
            {
                Interface inter = ObjEF.Interfaces.First(it => it.Id_interface == i);
                objState.ChangeRelationshipState(ObjEF, inter, it => it.Interfaces, System.Data.EntityState.Deleted);
            }

            foreach (int i in lstInterfaces.Except(lst))
            {
                Interface inter = contexto.Interface.FirstOrDefault(it => it.Id_interface == i);
                ObjEF.Interfaces.Add(inter);
            }

            base.Update();
        }
    }
}
