<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Develop.aspx.cs" Inherits="WebApplication2.Develop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Let me scan your barcode</title>
<link rel="stylesheet" href="style.css" />
<script src="WebCamJS.js" type="text/javascript">
</script>
</head>
<body>
    <div class="wrapper">
        <form id="form1" runat="server">
        <div class="barcodeElements">
            <h2>Let me scan your barcode</h2>
            <video  id="video" runat="server" autoplay="autoplay"></video> 
            <canvas id='canvas' runat="server" width='640' height='480'></canvas> 
            <textarea runat="server" id="postVariable"></textarea>
        </div>
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <div>
                <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="5000">
                </asp:Timer>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
        </div> 
        </form>
    </div>
    <div class="footer">
        <p id="copyRight_text">Created by <span style="font-weight: bold; font-size: 15px;">Nakiden Viktor</span></p>
    </div>
</body>
</html>
