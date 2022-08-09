<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insert.aspx.cs" Inherits="DBFood.insert" MasterPageFile="~/GlobalMaster.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="BodyContent">

    <h2>Insert product data</h2>

    <label>Code</label>
    <asp:TextBox ID="code" runat="server" />
    <br />
    <label>Name</label>
    <asp:TextBox ID="name" runat="server" />
    <br />
    <label>Description</label>
    <asp:TextBox ID="description" runat="server" />
    <br />
    <label>Brand</label>
    <asp:TextBox ID="brand" runat="server" />
    <br />
    <label>Embcode</label>
    <asp:TextBox ID="embcode" runat="server" TextMode="Number"/>
    <br />
    <label>Owner</label>
    <asp:TextBox ID="owner" runat="server" />
    <br />
    <label>IVA Percentage</label>
    <asp:TextBox ID="iva" runat="server" TextMode="Number"  />
    <br />
    <label>Quantity</label>
    <asp:TextBox ID="quantity" runat="server" />
    <br />
    <label>Measuring unit</label>
    <asp:TextBox ID="unit" runat="server" />
    <br />
    <label>Is Gluten free?</label>
    <asp:CheckBox ID="glutenfree" runat="server" />
    
    <label>Is Vegetarian?</label>
    <asp:CheckBox ID="vegetarian" runat="server" />
    
    <label>Is Vegan?</label>
    <asp:CheckBox ID="vegan" runat="server" />
   
    <label>Has Palmoil?</label>
    <asp:CheckBox ID="has_palmoil" runat="server" />
    <br />
    <label>NOVAGROUP</label>
    <asp:DropDownList ID="novagroup" runat="server">
        <asp:ListItem Text="1" Value="1"></asp:ListItem>
        <asp:ListItem Text="2" Value="2"></asp:ListItem>
        <asp:ListItem Text="3" Value="3"></asp:ListItem>
        <asp:ListItem Text="4" Value="4"></asp:ListItem>
    </asp:DropDownList>
    <br />
        <label>NUTRISCORE</label>
    <asp:DropDownList ID="nutriscore" runat="server">
        <asp:ListItem Text="A" Value="A"></asp:ListItem>
        <asp:ListItem Text="B" Value="B"></asp:ListItem>
        <asp:ListItem Text="C" Value="C"></asp:ListItem>
        <asp:ListItem Text="D" Value="D"></asp:ListItem>
                <asp:ListItem Text="E" Value="E"></asp:ListItem>

    </asp:DropDownList>
    <br />
        <label>ECOSCORE</label>
    <asp:DropDownList ID="ecoscore" runat="server">
        <asp:ListItem Text="A" Value="A"></asp:ListItem>
        <asp:ListItem Text="B" Value="B"></asp:ListItem>
        <asp:ListItem Text="C" Value="C"></asp:ListItem>
        <asp:ListItem Text="D" Value="D"></asp:ListItem>
                <asp:ListItem Text="E" Value="E"></asp:ListItem>

    </asp:DropDownList>

    <label>IMAGEN</label>
    <asp:FileUpload ID="image" runat="server" ></asp:FileUpload>
    <br />

    <asp:Button ID="addProduct"
        Text="Add"
        OnClick="addProduct_Click"
        CssClass="btn btn-primary"
        runat="server" />

    <div class="alert alert-success " type="alert" role="alert">
        <asp:Label ID="walertsuccess" runat="server"></asp:Label>
    </div>
        <div class="alert alert-danger " type="alert" role="alert">
        <asp:Label ID="walertdanger" runat="server"></asp:Label>
    </div>






</asp:Content>
