<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insert.aspx.cs" Inherits="DBFood.insert" MasterPageFile="~/GlobalMaster.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="BodyContent">
    <br />
    <h2>Insert new Product </h2>
    <br />
    <br />
    <h5>Product Info</h5>

    <div class="row">

        <div class="col-sm-4">
            <label>Code</label>
            <br />
            <asp:TextBox ID="code" runat="server" />
            <br />
            <label>Name</label>
            <br />
            <asp:TextBox ID="name" runat="server" />

            <br />
            <label>Description</label>
            <br />
            <asp:TextBox ID="description" runat="server" />
            <br />

            <label>Embcode</label>
            <br />
            <asp:TextBox ID="embcode" runat="server" TextMode="Number" />

            <br />
            <label>IVA Percentage</label>
            <br />
            <asp:TextBox ID="iva" runat="server" TextMode="Number" />
            <br />
        </div>

        <div class="col-sm-4">
            <label>Brand</label>
            <br />
            <asp:TextBox ID="brand" runat="server" />
            <br />
            <label>Owner</label>
            <br />
            <asp:TextBox ID="owner" runat="server" />

            <br />


            <label>Quantity</label>
            <br />
            <asp:TextBox ID="quantity" runat="server" />

            <br />
            <label>Measuring unit</label>
            <br />
            <asp:TextBox ID="unit" runat="server" />
            <br />

        </div>
        <div class="col-sm-4">

            <li>
                <label>Is Gluten free?</label>
                <asp:CheckBox ID="glutenfree" runat="server" />

            <li>
                <label>Is Vegetarian?</label>
                <asp:CheckBox ID="vegetarian" runat="server" />
            </li>

            <li>
                <label>Is Vegan?</label>
                <asp:CheckBox ID="vegan" runat="server" />
            </li>

            <li>
                <label>Has Palmoil?</label>
                <asp:CheckBox ID="has_palmoil" runat="server" />
            </li>
            <br />

            <label>-NUTRISCORE</label>
            <asp:DropDownList ID="nutriscore" runat="server">
                <asp:ListItem Text="-" Value=""></asp:ListItem>
                <asp:ListItem Text="A" Value="A"></asp:ListItem>
                <asp:ListItem Text="B" Value="B"></asp:ListItem>
                <asp:ListItem Text="C" Value="C"></asp:ListItem>
                <asp:ListItem Text="D" Value="D"></asp:ListItem>
                <asp:ListItem Text="E" Value="E"></asp:ListItem>

            </asp:DropDownList><br />
            <label>-ECOSCORE</label>
            <asp:DropDownList ID="ecoscore" runat="server">
                <asp:ListItem Text="-" Value=""></asp:ListItem>

                <asp:ListItem Text="A" Value="A"></asp:ListItem>
                <asp:ListItem Text="B" Value="B"></asp:ListItem>
                <asp:ListItem Text="C" Value="C"></asp:ListItem>
                <asp:ListItem Text="D" Value="D"></asp:ListItem>
                <asp:ListItem Text="E" Value="E"></asp:ListItem>

            </asp:DropDownList>
            <br />
            <label>-NOVAGROUP</label>
            <asp:DropDownList ID="novagroup" runat="server">
                <asp:ListItem Text="-" Value=""></asp:ListItem>

                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                <asp:ListItem Text="4" Value="4"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />


            <label><i class="far fa-image"></i> Image </label><br />
            <asp:FileUpload ID="image" runat="server"></asp:FileUpload>
            <br />

        </div>
    </div>





    <br />




    <br />
    

    <h5>Ingredients
    </h5>
    <label>Name</label>
    <input id="ingredient" type="text" />
    <label>Description</label>
    <input id="ingredient_description" type="text" />
    <label>Percentage</label>

    <input id="ingredient_percentage" type="number" />


    <label>Is an additive?</label>
    <input type="checkbox" id="ingredient_additive">

    <button type="button" class="btn text-success" onclick="listIngredients()"><b>Add+</b></button>

    <ul id="ingredients_list"></ul>

    <asp:TextBox ID="ingredients" runat="server" hidden></asp:TextBox>
    <asp:TextBox ID="ingredients_description" runat="server" hidden></asp:TextBox>
    <asp:TextBox ID="ingredients_percentage" runat="server" hidden></asp:TextBox>
    <asp:TextBox ID="ingredients_additive" runat="server" hidden></asp:TextBox>



    <br />

    <h5>Intolerances
    </h5>
    <label>Name</label>


    <input id="intolerance" type="text" />


    <button type="button" class="btn text-success" onclick="listIntolerances()"><b>Add+</b></button>

   
        <ul id="intolerances_list"></ul>
    <asp:TextBox ID="intolerances" runat="server" hidden></asp:TextBox>


    <br />
    <h5>Package materials</h5>

    <label>Name</label>


    <input id="material" type="text" />


    <button type="button" class="btn text-success" onclick="listMaterials()"><b>Add+</b></button>

   
        <ul id="materials_list"></ul>
    <asp:TextBox ID="materials" runat="server" hidden></asp:TextBox>
    <br />
    <h5>Pack</h5>
    <label>Is a pack?</label>
    <asp:CheckBox ID="pack_check" runat="server" ClientIDMode="Static" OnChange="$('#pack_options').toggle();" />

    <div id="pack_options" runat="server">
        <!--visibility="hidden"
        <label>Material</label><br />
        <asp:TextBox ID="pack_material" runat="server" ClientIDMode="Static" />
  -->
        <br />
        <label>Multiplier</label>
        <asp:TextBox ID="pack_multiplier" runat="server" TextMode="Number" ClientIDMode="Static" />
        <br />
    </div>
    <br /><br />
    <h5>Nutritional Facts</h5>

    <!-- Especificar valores minimos para su consdieracion-->
    <!--Hacer desplgables-->
    <div class="row">
        <div class="col-sm-2">
            <label>Energy</label>
            <asp:TextBox ID="nfenergy" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Fat</label>
            <asp:TextBox ID="nffat" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Satured Fat</label>
            <asp:TextBox ID="nfsaturedfat" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Carbohydrates</label>
            <asp:TextBox ID="nfcarbohydrates" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Sugars</label>
            <asp:TextBox ID="nfsugars" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Fiber</label>
            <asp:TextBox ID="nffiber" runat="server" TextMode="Number" Text="0" />
        </div>



    </div>

    <div class="row">
        <div class="col-sm-2">
            <label>Proteins</label>
            <asp:TextBox ID="nfproteins" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Alcohol</label>
            <asp:TextBox ID="nfalcohol" runat="server" TextMode="Number" Text="0" />
        </div>

        <div class="col-sm-2">
            <label>Salt</label>
            <asp:TextBox ID="nfsalt" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Extras*</label>
            <asp:TextBox ID="nfextras" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Vitamine A</label>
            <asp:TextBox ID="nfvita" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Vitamine D</label>
            <asp:TextBox ID="nfvitd" runat="server" TextMode="Number" Text="0" />
        </div>
    </div>



    <div class="row">
        <div class="col-sm-2">
            <label>Vitamine E</label>

            <asp:TextBox ID="nfvite" runat="server" TextMode="Number" Text="0" />
        </div>

        <div class="col-sm-2">

            <label>Vitamine K</label>
            <asp:TextBox ID="nfvitk" runat="server" TextMode="Number" Text="0" />
        </div>

        <div class="col-sm-2">
            <label>Vitamine C</label>
            <asp:TextBox ID="nfvitc" runat="server" TextMode="Number" Text="0" />
        </div>

        <div class="col-sm-2">
            <label>Thiamine</label>
            <asp:TextBox ID="nfthiamine" runat="server" TextMode="Number" Text="0" />
        </div>

        <div class="col-sm-2">
            <label>Riboflavin</label>
            <asp:TextBox ID="nfriboflavin" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Niacin</label>
            <asp:TextBox ID="nfniacin" runat="server" TextMode="Number" Text="0" />
        </div>


    </div>

    <div class="row">

        <div class="col-sm-2">
            <label>Vitamine B6</label>
            <asp:TextBox ID="nfvitb6" runat="server" TextMode="Number" Text="0" />
        </div>

        <div class="col-sm-2">

            <label>Folic acid</label>
            <asp:TextBox ID="nffolicacid" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Vitamine B12</label>
            <asp:TextBox ID="nfvitb12" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Biotine</label>
            <asp:TextBox ID="nfbiotine" runat="server" TextMode="Number" Text="0" />

        </div>
        <div class="col-sm-2">

            <label>Pantothenic Acid</label>
            <asp:TextBox ID="nfpantothenicacid" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Potassium</label>
            <asp:TextBox ID="nfpotassium" runat="server" TextMode="Number" Text="0" />
        </div>
    </div>


    <div class="row">
        <div class="col-sm-2">
            <label>Chlorine</label>
            <asp:TextBox ID="nfchlorine" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Calcium</label>
            <asp:TextBox ID="nfcalcium" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">

            <label>Phosphorus</label>
            <asp:TextBox ID="nfphosphorus" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Magnesium</label>
            <asp:TextBox ID="nfmagnesium" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Iron</label>
            <asp:TextBox ID="nfiron" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Zinc</label>
            <asp:TextBox ID="nfzinc" runat="server" TextMode="Number" Text="0" />
        </div>

    </div>



    <div class="row">
        <div class="col-sm-2">
            <label>Copper</label>
            <asp:TextBox ID="nfcopper" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Manganese</label>
            <asp:TextBox ID="nfmanganese" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Fluorine</label>
            <asp:TextBox ID="nffluorine" runat="server" TextMode="Number" Text="0" />

        </div>
        <div class="col-sm-2">
            <label>Selenium</label>
            <asp:TextBox ID="nfselenium" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">
            <label>Chrome</label>
            <asp:TextBox ID="nfchrome" runat="server" TextMode="Number" Text="0" />
        </div>
        <div class="col-sm-2">

            <label>Molybdenum</label>
            <asp:TextBox ID="nfmolybdenum" runat="server" TextMode="Number" Text="0" />
        </div>
    </div>

    <div class="row">
        <div class="col-sm-2">
            <label>Iodine</label>
            <asp:TextBox ID="nfiodine" runat="server" TextMode="Number" Text="0" />
        </div>
    </div>

    <!--CREATE PREVIEW BUTTON FOR PREVIEW nf TABLE-->



    <br />

    <asp:Button ID="wBtnAddProduct"
        Text="Add"
        OnClick="wBtnAddProduct_Click"
        CssClass="btn btn-primary"
        runat="server" />

    <!--  <div class="alert alert-success " type="alert" role="alert">
        <asp:Label ID="walertsuccess" runat="server"></asp:Label>
    </div>
        <div class="alert alert-danger " type="alert" role="alert">
        <asp:Label ID="walertdanger" runat="server"></asp:Label>
    </div>

    -->

    <script>
        $("#pack_options").hide();


        //ingredients
        let ingredients_Arr = [];
        let ingredients_description_Arr = [];
        let ingredients_percentage_Arr = [];
        let ingredients_additive_Arr = [];
        let ing = 0;

        //intolerances
        let intolerance_Arr = [];
        let int = 0;

        //materials

        let materials_Arr = [];
        let mat = 0;

     
     

        function listIngredients() {

            let ingredient = $("#ingredient").val();
            let description = $("#ingredient_description").val();
            let percentage = $("#ingredient_percentage").val();
            let additive = "";

            ingredients_Arr.push(ingredient);
            ingredients_description_Arr.push(description);
            ingredients_percentage_Arr.push(percentage);

            if ($("#ingredient_additive:checked").val()) {

                ingredients_additive_Arr.push(true);
                additive = "(additive)";
            } else {

                ingredients_additive_Arr.push(false);

            }

            $('#ingredients_list').append('<li id="ingredient' + ing + '">' + ingredient + ' ' + description + ' (' + percentage + '%)  ' + additive + ' <button class="btn text-danger" onclick="$(\'#ingredient' + ing + '\').remove();discardIngredient(' + ing + ')"><b>X</b></button></li>')


            ing++;


            $("#ingredient").val('');
            $("#ingredient_description").val('');
            $("#ingredient_percentage").val('');
            $("#ingredient_additive").prop('checked', false);


            $("#ingredients").val(ingredients_Arr.toString());
            $("#ingredients_description").val(ingredients_description_Arr.toString());
            $("#ingredients_percentage").val(ingredients_percentage_Arr.toString());
            $("#ingredients_additive").val(ingredients_additive_Arr.toString());



        }

        function discardIngredient(indice) {


            ingredients_Arr.splice(indice, 1);
            ingredients_description_Arr.splice(indice, 1);
            ingredients_percentage_Arr.splice(indice, 1);
            ingredients_additive_Arr.splice(indice, 1);


        }

        function listIntolerances() {

            console.log('lo');

            let intolerance = $("#intolerance").val();

            intolerance_Arr.push(intolerance);

            $("#intolerance").val('');


            $("#intolerances_list").append('<li id="intolerance' + int + '">' + intolerance + ' <button class="btn text-danger" onclick="$(\'#intolerance' + int + '\').remove();discardIntolerance(' + int + ')"><b>X</b></button></li>');

            int++;
            $("#intolerances").val(intolerance_Arr.toString());

            console.log(intolerance_Arr);


        }
        function discardIntolerance(indice) {

            intolerance_Arr.splice(indice, 1);

            console.log(intolerance_Arr);
        }


        function listMaterials() {


            let material = $("#material").val();

            materials_Arr.push(material);

            $("#material").val('');


            $("#materials_list").append('<li id="material' + mat + '">' + material+ ' <button class="btn text-danger" onclick="$(\'#material' + mat + '\').remove();discardMaterial(' + mat + ')"><b>X</b></button></li>');

            mat++;
            $("#materials").val(materials_Arr.toString());

            console.log(materials_Arr);


        }
        function discardMaterial(indice) {

            materials_Arr.splice(indice, 1);

            console.log(materials_Arr);
        }




    </script>


</asp:Content>
