using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToysForBoysLibrary
{
    public class Productline
    {
        private int id;
        private string name;
        private string description;
        private bool changed;

        public int Id
        {
            get { return id; }
        }
        public string Name
        {
            get { return name; }
            set
            {
                name = value;
                Changed = true;
            }
        }
        public string Description
        {
            get { return description; }
            set
            {
                description = value;
                Changed = true;
            }
        }

        public bool Changed
        {
            get { return changed; }
            set
            {
                changed = value;
            }
        }
        
        public Productline(int id, string name, string scale)
        {
            this.id = id;
            Name = name;
            Description = description;
            Changed = false;
        }

        public Productline() { }
    }
}