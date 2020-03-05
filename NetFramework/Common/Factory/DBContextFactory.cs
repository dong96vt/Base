using NetFramework.Database;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace NetFramework.Common.Factory
{
    public class ContextFactory<T> : DbContext where T : class
    {
        BaseDBEntities baseDBEntities;
        public ContextFactory() : base()
        {
            baseDBEntities = new BaseDBEntities();
        }
        public DbSet<T> GetContext()
        {
            foreach(var context in baseDBEntities.GetType().GetProperties())
            {
                if (context.PropertyType == typeof(DbSet<T>)) return (DbSet<T>)context.GetValue(baseDBEntities);
            }
            throw new Exception("Not found DbSet");
        }
        public DbContextTransaction CreateTransaction()
        {
            return baseDBEntities.Database.BeginTransaction();
        }

        public int Save()
        {
            return baseDBEntities.SaveChanges();
        }

    }
}