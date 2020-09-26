using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechnologyComparerService.Models
{
    public class Factor
    { 
        public int FactorID { get; set;}
        public string FactorDescription { get; set; }
    }

    public class Sector
    {
        public int SectorID { get; set; }
        public string SectorDescription { get; set; }
    }

    public class Value
    {
        public int ValueID { get; set; }
        public string ValueDescription { get; set; }
    }

    public class FactorSectorValue
    {
        public List<Factor> factorList { get; set; }
        public List<Sector> sectorList { get; set; }
        public List<Value> valueList { get; set; }
    }
}