<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DBFood.index" MasterPageFile="~/GlobalMaster.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="BodyContent">
    <div class="container-fluid">

        <br />


        <div class="row">
            <div class="col-12">

                <table id="DTProducts" class="table table-hover w-100 row-border text-center ">

                    <thead>
                        <tr>

                            <th>Product Code</th>
                            <th>Description</th>
                            <th>IVA</th>
                            <th>More Info</th>

                        </tr>
                    </thead>
                </table>

            </div>
        </div>
    </div>

    <script>

        function genDTProducts(jsonData) {

            jsonData = JSON.parse(jsonData);
            console.log(jsonData);
            var tabDTDet = $("#DTProducts").DataTable({
                data: jsonData,
                columns:
                    [
                        {
                            data: "code",
                        },
                        {
                            data: "description",
                            /* render: function (data, type, row) {
                                 if (type === "display" ){
                                     data = '<label style="color: red">' + data + '</label>';
                                 }
                                 
                                 return data;    
                             }*/

                        },
 {
     data: "iva",
 },
                        {
                            data: null,
                            render: function (data, type, row) {
                                if (type === "display") {
                                    data = '<a href="product.aspx?code='+ row.code+'"><button type="button" class="btn btn-dark" > <i class="far fa-plus-circle"></button></a>';
                                }

                                return data;
                            }

                        }

                    ],

            });
        };



    </script>
</asp:Content>


