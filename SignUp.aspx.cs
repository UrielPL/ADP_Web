using ADP.Models;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADP
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string registrar(string nombre, string apellidos, string fecha, string edad, string genero, string email, string pass)
        {
            UsuarioDTO user = new UsuarioDTO();
            user.Nombre = nombre;
            user.Apellidos = apellidos;
            user.FechaNacimiento = DateTime.Parse(fecha);
            user.Edad = int.Parse(edad);
            user.Genero = genero;
            user.Email = email;
            user.Password = pass;

            var client = new RestClient(Util.WSURL());
            var request = new RestRequest("Usuarios", Method.POST);
            var json = JsonConvert.SerializeObject(user);

            request.AddJsonBody(json);
            
            IRestResponse restResponse = client.Execute(request);
            var respuesta = restResponse.StatusCode;
            if(respuesta == System.Net.HttpStatusCode.OK)
            {
                return restResponse.Content;
            }
            return "-1";
        }
    }
}