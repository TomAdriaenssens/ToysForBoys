//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public product()
        {
            this.orderdetails = new HashSet<orderdetail>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string scale { get; set; }
        public string description { get; set; }
        public Nullable<int> quantityInStock { get; set; }
        public Nullable<int> quantityInOrder { get; set; }
        public Nullable<decimal> buyPrice { get; set; }
        public Nullable<int> productlineId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<orderdetail> orderdetails { get; set; }
        public virtual productline productline { get; set; }
    }
}
