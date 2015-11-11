using System;
using System.Web;
using System.Web.UI;
using System.IO;

namespace WebApplication2
{
    public partial class Develop : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        public static void UploadPic(string imageData)
        {
            string Pic_Path = HttpContext.Current.Server.MapPath("MyPicture.png");
            byte[] data = Convert.FromBase64String(imageData);
            File.WriteAllBytes(Pic_Path, data);
        }


        public void sendMessage(object sender, EventArgs e, string message)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + message + "')", true);
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "captureVideo", "captureVideo()", true);
            UploadPic(postVariable.InnerText);
            string Src = HttpContext.Current.Server.MapPath("MyPicture.png");

            if (File.ReadAllBytes(Src).Length > 0)
            {
                string[] readedCode = Spire.Barcode.BarcodeScanner.Scan(Src, Spire.Barcode.BarCodeType.Code39);

                if (readedCode.Length > 0) sendMessage(sender, e, readedCode[0]);
            }
        }
    }
}