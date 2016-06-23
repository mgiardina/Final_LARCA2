using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public abstract class BaseDAL<T> where T : class
    {
        public Larca2Entities Context;
        public BaseDAL()
        {
            Context = new Larca2Entities();
        }
        public abstract bool Guardar(T entity);
        public abstract List<T> Todos();
        public abstract T Traer(long id);
        public abstract bool Eliminar(long id);
    }
}
