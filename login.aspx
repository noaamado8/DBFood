<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DBFood.login"  MasterPageFile="~/GlobalMaster.Master"  %>

<asp:Content runat="server" ContentPlaceHolderID="BodyContent">


    <div class="container">

                <h2>Login:</h2>
            <br />
            <label>Email</label>
            <asp:TextBox ID="email" runat="server" />
            <br />
            <br />
            <label>Password</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" />
            <br />
            <br />
            <asp:Button ID="submit"
                Text="Log In"
                OnClick="login_Click"
                CssClass="btn btn-primary"
                runat="server" />

           
         
                <asp:Label ID="walertdanger" runat="server"></asp:Label>
                      
          <!--  <span>Non estás rexistrado? <a href="register.aspx">Rexístrate!</a></span>
        -->
  
        </div>

</asp:Content>