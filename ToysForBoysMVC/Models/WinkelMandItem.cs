using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ToysForBoysMVC.Models
{
    public class WinkelMandItem
    {
        public int ID { get; set; }
        public string Naam { get; set; }
        public int AantalTeBestellen { get; set; }
        public int? AantalInStock { get; set; }
        public decimal? Prijs { get; set; }
        [DisplayFormat(DataFormatString = "{0:€ #,##0.00}")]
        public decimal? TotaalVanAantal { get; set; }
    }
}