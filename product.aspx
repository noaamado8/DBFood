<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="DBFood.product" MasterPageFile="~/GlobalMaster.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="BodyContent">

    <div class="container">

        <br />
        <br />
        <div class="row text-center">

            <h2>
                <asp:Label ID="name" runat="server" /></h2>



        </div>

        <br />


        <div class="row">

            <div class="col-sm-6">

                <br />

                <b>
                    <asp:Label ID="code" runat="server">CODE:</asp:Label></b>
                <br />

                <asp:Label ID="description" runat="server"> </asp:Label>

                <br />

                <asp:Label ID="quantity" runat="server">Quantity: </asp:Label>

                <asp:Label ID="units" runat="server"> </asp:Label>
                <br />


                <asp:Label ID="brand" runat="server"> </asp:Label>,   

              <asp:Label ID="owner" runat="server"> </asp:Label>
                <br />

                <asp:Label ID="iva" runat="server">IVA:</asp:Label>

                <br />
                <asp:Label ID="embcode" runat="server">Embcode:  </asp:Label>


                <br />


                <br />
                <b>Ingredients:</b> 
                <ul id="ingredients"></ul>






            </div>

            <div class="col-sm-6">

                <asp:Image ID="productimage" runat="server" Width="100%" />



            </div>

        </div>

        <br />




    </div>

    <div class="row">

        <div class="col-sm-6">
            <div id="suitable" class="row">
            </div>
            "

        </div>




        <br />

        <div class="col-sm-6">
            <div id="scores" class="row">
            </div>


        </div>

    </div>

    <br />
    <caption>Nutritional Facts (As sold for 100 g / 100 ml)</caption>
    <table id="nf" class="table" style="border-width: 1px">
    </table>


    <div id="mostrar"></div>



    <script>


 
        function _showProduct(jsonData) {

          


            //show basic info

            jsonData = JSON.parse(jsonData);
            console.log(jsonData);

            $("#name").text(jsonData.name);
            $("#code").text(jsonData.code);
            $("#description").text(jsonData.description);
            $("#quantity").text(jsonData.quantity);
            $("units").text(jsonData.unit);
            $("brand").text(jsonData.brand);
            $("#owner").text(jsonData.owner);
            $("#iva").text(jsonData.iva);
            $("#embcode").text(jsonData.embcode);





            if ((jsonData.glutenfree) == true) {

                $("#suitable").append('<div class="col-sm-3"><img src="cgi-bin\\pics\\labels\\glutenfree.png" width="80px"> </div>');
            }

            if ((jsonData.palmoil) == false) {

                $("#suitable").append('<div class="col-sm-3"><img src="cgi-bin\\pics\\labels\\palmoil.png" width="100px"> </div>');
            }

            if (jsonData.vegetarian == true && jsonData.vegan == false) {

                $("#suitable").append('<div class="col-sm-3"><img src="cgi-bin\\pics\\labels\\vegetarian.png" width="80px"> </div>');

            }

            if ((jsonData.vegan) == true) {

                $("#suitable").append('<div class="col-sm-3"><img src="cgi-bin\\pics\\labels\\vegan.png" width="80px"> </div>');
            }

            let nutriscore_img;

            switch (jsonData.nutriscore) {

                case 'A':
                    nutriscore_img = "nutriscoreA";
                    break;
                case 'B':
                    nutriscore_img = "nutriscoreB";
                    break;

                case 'C':
                    nutriscore_img = "nutriscoreC";
                    break;

                case 'D':
                    nutriscore_img = "nutriscoreD";
                    break;

                case 'E':
                    nutriscore_img = "nutriscoreE";

            }


            $("#scores").append('<div id="nutriscoreDiv" class="col-sm-4"></div>')

            $("#nutriscoreDiv").append('<img src="cgi-bin\\pics\\labels\\' + nutriscore_img + '.png" class="w-100">');

            let ecoscore_img;

            switch (jsonData.ecoscore) {

                case 'A':
                    ecoscore_img = "ecoscoreA";
                    break;
                case 'B':
                    ecoscore_img = "ecoscoreB";
                    break;

                case 'C':
                    ecoscore_img = "ecoscoreC";
                    break;

                case 'D':
                    ecoscore_img = "ecoscoreD";
                    break;

                case 'E':
                    ecoscore_img = "ecoscoreE";

            }


            $("#scores").append('<div id="ecoscoreDiv" class="col-sm-4"></div>')

            $("#ecoscoreDiv").append('<img src="cgi-bin\\pics\\labels\\' + ecoscore_img + '.png" class="w-100">');


            let novagroup_img;
            switch (jsonData.novagroup) {

                case '1':
                    novagroup_img = "novagroup1";
                    break;
                case '2':
                    novagroup_img = "novagroup2";
                    break;

                case '3':
                    novagroup_img = "novagroup3";
                    break;

                case '4':
                    novagroup_img = "novagroup4";


            }

            //showwwwwwwwwwwwwww novagroup

            let caption = $('<caption>').text('As sold for 100 g / 100 ml');
            $('#nf').append(caption);

            let thead = $('<thead>');

            $(thead).append($('<th>').text('Energy'));
            $(thead).append($('<th>').text('Fat'));
            $(thead).append($('<th>').text('Satured fat'));
            $(thead).append($('<th>').text('Carbohydrates'));
            $(thead).append($('<th>').text('Sugars'));
            $(thead).append($('<th>').text('Fiber'));
            $(thead).append($('<th>').text('Proteins'));
            $(thead).append($('<th>').text('Alcohol'));
            $(thead).append($('<th>').text('Others'));


            $('#nf').append(thead);


            let tbody = $('<tbody>');

            let tr = $('<tr>');

            let td = $('<td>').text(jsonData.nutritionalFacts.energy);
            $(tr).append(td);
            td = $('<td>').text(jsonData.nutritionalFacts.fat);
            $(tr).append(td);
            td = $('<td>').text(jsonData.nutritionalFacts.saturedfat);
            $(tr).append(td);
            td = $('<td>').text(jsonData.nutritionalFacts.carbohydrates);
            $(tr).append(td);
            td = $('<td>').text(jsonData.nutritionalFacts.sugars);
            $(tr).append(td);
            td = $('<td>').text(jsonData.nutritionalFacts.fiber);
            $(tr).append(td);
            td = $('<td>').text(jsonData.nutritionalFacts.proteins);
            $(tr).append(td);
            td = $('<td>').text(jsonData.nutritionalFacts.alcohol);
            $(tr).append(td);
            td = $('<td>').text(jsonData.nutritionalFacts.extras);
            $(tr).append(td);

            $(tbody).append(tr);
            $('#nf').append(tbody);

         


            


            $.each(jsonData.ingredients, function () {
                $("#ingredients").append('<li>'+this.name+' '+this.description+'</li>')
            });


            $("#productimage").attr('src', 'cgi-bin/pics/' + jsonData.image);


        }





    </script>


</asp:Content>
