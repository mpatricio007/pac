using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace DAL
{    
    public interface IBaseCrud<T>
    {
        void Get(KeyValuePair<string, object> keysANDvalues);
        void Add();
        void Delete();
        void Update();
        void Attach();
        void Detach();
        IQueryable<T> Find(Expression<System.Func<T, bool>> where);
        IQueryable<T> GetAll();
        bool SaveChanges();
    }
}
