using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NetFramework.Common
{
    public static class CustomMapper
    {
        public static TDestination UpdateDataMap<TSource, TDestination>(TSource source, TDestination destination)
        {
            Type destinationType = typeof(TDestination);
            foreach (var sourceProperty in typeof(TSource).GetProperties())
            {
                var destinationProperty = destinationType.GetProperty(sourceProperty.Name);
                var sourcePropertyValue = sourceProperty.GetValue(source);
                if (destinationProperty != null && sourcePropertyValue != null) destinationProperty.SetValue(destination, sourcePropertyValue);
            }
            return destination;
        }
    }
}