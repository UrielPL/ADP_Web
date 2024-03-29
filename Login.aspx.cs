﻿using ADP.Models;
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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string loginUser(string email, string pass)
        {
            var client = new RestClient(Util.WSURL());
            var request = new RestRequest("Usuarios?email=" + email + "&contra=" + pass, Method.GET);
            IRestResponse restResponse = client.Execute(request);

            if(restResponse.StatusCode == System.Net.HttpStatusCode.OK)
            {
                var content = restResponse.Content;
                return JsonConvert.SerializeObject(content);
            }

            return "-1";
            
        }
    }
}