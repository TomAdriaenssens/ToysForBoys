﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ToysForBoysMVC.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class toysforboysEntities : DbContext
    {
        public toysforboysEntities()
            : base("name=toysforboysEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<country> countries { get; set; }
        public virtual DbSet<customer> customers { get; set; }
        public virtual DbSet<orderdetail> orderdetails { get; set; }
        public virtual DbSet<order> orders { get; set; }
        public virtual DbSet<productline> productlines { get; set; }
        public virtual DbSet<product> products { get; set; }
    
        public virtual ObjectResult<productline> GetAllProductLines2()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<productline>("GetAllProductLines2");
        }
    
        public virtual ObjectResult<productline> GetAllProductLines2(MergeOption mergeOption)
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<productline>("GetAllProductLines2", mergeOption);
        }
    }
}