using NetFramework.Common.Factory;
using System;
using System.Linq.Dynamic;
using System.Data.Entity;
using AutoMapper;
using NetFramework.Models.DTO;
using System.Linq;
using System.Collections.Generic;

namespace NetFramework.Models.DAO
{
    public class BaseDAO<TDTO,T> : IDisposable where TDTO : BaseDTO where T : class
    {
        private DbSet<T> context;
        private ContextFactory<T> contextFactory;
        private IMapper mapper;
        private string queryCondition;
        public BaseDAO() {
            contextFactory = new ContextFactory<T>();
            context = contextFactory.GetContext();
            mapper = new MapperConfiguration(cfg => {
                cfg.CreateMap<TDTO, T>();
                cfg.CreateMap<T, TDTO>();
            }).CreateMapper();
            queryCondition = "ID.Equals(id)";
        }
        public TDTO Get(Guid? id)
        {
            return mapper.Map<T, TDTO>(context.Where(queryCondition)?.FirstOrDefault());
        }
        public IEnumerable<TDTO> GetAll()
        {
            return mapper.Map<IEnumerable<T>, IEnumerable<TDTO>>(context);
        }

        public int Insert(params TDTO[] objs)
        {
            try
            {
                context.AddRange(mapper.Map<TDTO[], T[]>(objs));
                return contextFactory.Save();
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public int Update(params TDTO[] objs)
        {
            try
            {
                foreach (var obj in objs)
                {
                    var entity = context.Where(queryCondition).FirstOrDefault();
                    entity = mapper.Map<TDTO, T>(obj);
                }
                return contextFactory.Save();
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public int Delete(params TDTO[] objs)
        {
            try
            {
                foreach (var obj in objs)
                {
                    var entity = context.Where(queryCondition).FirstOrDefault();
                    context.Remove(entity);
                }
                return contextFactory.Save();
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}