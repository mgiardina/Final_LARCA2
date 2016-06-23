using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Larca2.Models;

namespace Larca2.Views.ViewModels
{
    public class ManualUploadViewModel
    {
        public bool Parcial { get; set; }

        public ManualUploadViewModel()
        {
            Parcial = false;
        }
    }
}