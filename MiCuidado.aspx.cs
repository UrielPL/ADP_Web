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
    public partial class MiCuidado : System.Web.UI.Page
    {
        public static UsuarioDTO user { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string traeUser(string id)
        {
            var idUser = id.Replace("\"","");
            var client = new RestClient(Util.WSURL());
            var request = new RestRequest("Usuarios?id=" + idUser, Method.GET);
            IRestResponse restResponse = client.Execute(request);

            if (restResponse.StatusCode == System.Net.HttpStatusCode.OK)
            {

                user = JsonConvert.DeserializeObject<UsuarioDTO>(restResponse.Content);

                return JsonConvert.SerializeObject(user);
            }

            return "-1";
        }
    }
}