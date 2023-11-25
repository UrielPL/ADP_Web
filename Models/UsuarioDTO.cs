using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ADP.Models
{
    public class UsuarioDTO
    {
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public Nullable<int> Edad { get; set; }
        public Nullable<System.DateTime> FechaNacimiento { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Genero { get; set; }
    }
}