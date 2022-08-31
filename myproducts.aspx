<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myproducts.aspx.cs" Inherits="DBFood.myproducts" MasterPageFile="~/GlobalMaster.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="BodyContent">


    <div hidden id="hidden">

        <asp:TextBox ID="productCodeDel" runat="server" ClientIDMode="Static"></asp:TextBox>

        <asp:Button ID="wBtnDel" OnClick="wBtnDelete_Click" runat="server" ClientIDMode="Static"></asp:Button>

    </div>


    <div class="container-fluid">




        <br />

        <h1>My Product List</h1>

        <br />
        <div class="row text-center">
            <a href="insert.aspx">
                <button type="button" class="btn btn-button btn-success"><i class="far fa-plus-circle"></i>Add new product</button>
            </a>
        </div>
        <br />

        <div class="row">

            <div class="col-12">

                <table id="myProducts" class="table table-hover w-100 row-border text-center ">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Name</th>
                            <th>Embcode</th>
                            <th>Image</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                </table>

            </div>
        </div>
    </div>

    <script>

        function listMyProducts(jsonData) {

            jsonData = JSON.parse(jsonData);
            console.log(jsonData);
            var tabDTDet = $("#myProducts").DataTable({
                data: jsonData,
                columns:
                    [
                        {
                            data: "code",
                        },
                        {
                            data: "name",


                        },
 {
     data: "embcode",
 }, {
     data: "image",
     render: function (data, type, row) {
         if (type === "display") {
             data = '<img src="cgi-bin\\pics\\' + row.image + '"/ width="150px">';
         }
         return data;
     }
 },
                        {
                            data: null,
                            render: function (data, type, row) {

                                if (type === "display") {
                                    data = '<a href="product.aspx?code=' + row.code + '"><button type="button" class="btn btn-info" ><i class="far fa-info-circle"></i> </button></a>' + '&nbsp;' +
                                    '<a href="insert.aspx?code=' + row.code + '"><button type="button" class="btn btn-secondary" > <i class="far fa-edit"></i></button></a>' + '&nbsp;' +

                                     '<button type="button" class="btn btn-danger" onClick="click_deleteProduct(' + row.code + ')" > <i class="far fa-trash-alt"></i> </button>'


                                }
                                return data;
                            }

                        }

                    ],

            });
        };

        function click_deleteProduct(productcode) {

            console.log(productcode);
            $("#productCodeDel").val(productcode);
            $("#wBtnDel").click();



        }




    </script>
</asp:Content>


