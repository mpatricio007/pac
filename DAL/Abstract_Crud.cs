using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Linq.Expressions;
using System.Data.Objects.DataClasses;
using System.Data.Objects;
using System.Reflection;

namespace DAL
{ 
    public class Abstract_Crud<T>:IBaseCrud<T> where T: class
    {
        
        protected MedusaEntities contexto = new MedusaEntities();

        protected T objEF;

        public T ObjEF
        {
            get
            {
                if (objEF == null)                
                    objEF = contexto.CreateObject<T>();
                
                return objEF;
            }
            set { objEF = value; }
        }

        public virtual void Get(KeyValuePair<string, object> keysANDvalues)
        {   
            IEnumerable<KeyValuePair<string, object>> entityKeyValues = new KeyValuePair<string, object>[] { keysANDvalues };
            EntityKey key = new EntityKey(String.Format("{0}.{1}", contexto.GetType().Name, ObjEF.GetType().Name), entityKeyValues);            
            object obj = null;
            contexto.TryGetObjectByKey(key,out obj);
            objEF = (T)obj;
        }

        public virtual void Add()
        {   
            contexto.AddObject(objEF.GetType().Name, objEF);
        }

        public virtual void Delete()
        {          
            contexto.DeleteObject(objEF);
        }

        public virtual void Update()
        {            
            contexto.ApplyCurrentValues<T>(objEF.GetType().Name, objEF);             
        }

        public virtual void Attach()
        {
            contexto.AttachTo(objEF.GetType().Name, objEF);          
        }

        public void Detach()
        {
            contexto.Detach(objEF);
        }
        //não inverter a ordem dos Find por causa do PageCrud
        public IQueryable<T> Find(Expression<System.Func<T, bool>> where, string sortExpression, string sortDirection, int top)
        {
            return contexto.CreateObjectSet<T>().OrderBy(String.Format("it.{0} {1}", sortExpression, sortDirection)).Where(where).Take(top);
        }

        public IQueryable<T> Find(string where, ObjectParameter[] objs)
        {
            return contexto.CreateObjectSet<T>().Where(where, objs);
        }

        public IQueryable<T> Find(string where, ObjectParameter objs , string sortExpression, string sortDirection, int top)
        {
            return contexto.CreateObjectSet<T>().OrderBy(String.Format("it.{0} {1}", sortExpression, sortDirection)).Where(where, objs).Take(top);
        }

        public IQueryable<T> Find(Expression<System.Func<T, bool>> where)
        {            
            return contexto.CreateObjectSet<T>().Where(where);
        }

        public IQueryable<T> Find(Expression<System.Func<T, bool>> where, string sortExpression, string sortDirection)
        {
            return contexto.CreateObjectSet<T>().OrderBy(String.Format("it.{0} {1}", sortExpression, sortDirection)).Where(where);
        }

        public virtual IQueryable<T> GetAll()
        {
            return contexto.CreateObjectSet<T>();            
        }

        public bool SaveChanges()
        {
            return contexto.SaveChanges() > 0;
        }

        public IQueryable<T> GetAll(string sortExpression,string sortDirection,int top = 0)
        {
            if (top == 0)
                return contexto.CreateObjectSet<T>().OrderBy(String.Format("it.{0} {1}", sortExpression, sortDirection));
            else
                return contexto.CreateObjectSet<T>().OrderBy(String.Format("it.{0} {1}", sortExpression , sortDirection)).Take(top);
        }        

        public Expression<Func<T, bool>> FilterByObjString(object obj, string strProperty, string strMode)
        {
            ParameterExpression entity = Expression.Parameter(typeof(T), "it");
            string[] properties = strProperty.Split('.'); 
            Expression keyValue = Expression.PropertyOrField(entity, properties[0]);
            
            for (int i = 1; i < properties.Length; i++)
            {
                Expression parent = Expression.Property(entity,properties[0]);
                keyValue = Expression.Property(parent, properties[i]);
            }
            
            MethodInfo method = keyValue.Type.GetMethod(strMode, new[] { keyValue.Type });
            Expression pkValue = Expression.Constant(obj, keyValue.Type);
            Expression body = Expression.Call(keyValue, method, pkValue);
            return Expression.Lambda<Func<T, bool>>(body, entity);
        }
    }
}
