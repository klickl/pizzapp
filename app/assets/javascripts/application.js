// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

$(function(){
    initList();
    sortList("selectIngredient");

    $('.button-collapse').sideNav({'edge': 'left'});
    $('select').material_select();
    $('.scrollspy').scrollSpy();
    $('.dropdown-button').dropdown({
        hover:true
    });

    $('.collapsible').collapsible({
        accordion : true // A setting that changes the collapsible behavior to expandable instead of the default accordion style
    });


    $('.modal-trigger').leanModal({
            dismissible: true, // Modal can be dismissed by clicking outside of the modal
            opacity: .5, // Opacity of modal background
            in_duration: 300, // Transition in duration
            out_duration: 200, // Transition out duration
            ready: function() { alert('Ready'); }, // Callback for Modal open
            complete: function() { alert('Closed'); } // Callback for Modal close
        }
    );

    $('#selectIngredient').change( function(){
        if($(this).find("option").size() > 1){
            var input_value =  $("#input_ingredients").val();
            input_value += (input_value == "" ?"":",") + $(this).val();
            $("#input_ingredients").val(input_value).change();
            $("#selectIngredient option[value='"+($(this).val())+"']").remove();
        }

        changeList();

    });

    $(document).on('change', '#input_ingredients', function () {
        displayIngredients();
    });

    $(document).on('click', '.remove-elt', function(){

        //Récupération du texte de l'ingrédient que l'on veut supprimer
        var text = $(this).parents().get(0).innerText;
        var tab = $("#input_ingredients").val().split(",");
        var index = tab.indexOf(text);

        if(index > -1){
            tab.splice(index, 1);
        }

        $("#input_ingredients").val(tab.join(","));
        $("#selectIngredient").append('<option val="' + text + '">' + text + '</option>');

        changeList();
        displayIngredients();
    });

});

function displayIngredients(){
    $("#zone_ingredients").empty();
    var ref = $("#zone_ingredients");
    var tab = $("#input_ingredients").val().split(",");

    if(tab.length == 1){
        if(tab[0] == ""){
            tab.splice(0, 1)
        }
    }
    if(tab.length > 0) {
        for (var i in tab) {
            var add_offset = "";
            if (i % 2 == 1)
                add_offset = "offset-l2";
            ref.append('<div class="col l5 m12 s12 card grey darken-1 ' + add_offset + '"><div class="card-content white-text"><span><a href="#!" class="remove-elt"><i class="tiny mdi-action-delete right white-text"></i></a>' + tab[i] + '</span></div></div>');
        }
    }
}

function sortList(id){

    var option_dump_text = '';
    var option_dump_val = '';
    $('#' + id + ' option').each(function(){
        if($(this).val() == "label") {
            option_dump_text = $(this).text();
            option_dump_val = $(this).val();
            $("#"+id+" option[value='"+($(this).val())+"']").remove();
        }
    });

    var options = $('#' + id).find("option");

    var arr = options.map(function(_, o) { return { t: $(o).text(), v: o.value }; }).get();
    arr.sort(function(o1, o2) { return o1.t > o2.t ? 1 : o1.t < o2.t ? -1 : 0; });
    options.each(function(i, o) {
        o.value = arr[i].v;
        $(o).text(arr[i].t);
    });

    $("#"+id).prepend('<option value="'+option_dump_val+'" disabled selected>' + option_dump_text+'</option>');
}


function initList() {
    //on récupère tous les ingrédients présents dans la pizza
    var tab = $("#input_ingredients").text().split(",");
    if(tab.length == 1){
        if(tab[0] == ""){
            tab.splice(0, 1);
        }
    }
    if(tab.length > 0) {
        $('#selectIngredient').find("option").each(function () {
            var index = tab.indexOf($(this).text());
            if(index > -1){
                $("#selectIngredient option[value='"+($(this).val())+"']").remove();
            }
        });
    }
}

function changeList(){
    var id = "#selectIngredient";
    if($(id).find("option").size() == 1){

        $("#ingredients_select").css("display", "none");
        $("#no_ingredients_div").css("display", "block");
    }

    else if($(id).find("option").size() > 1){
        if($("#ingredients_select").css("display") == "none"){
            $("#ingredients_select").css("display", "block");
            $("#no_ingredients_div").css("display", "none");
        }
    }

    sortList("selectIngredient");

    $(id).material_select('destroy');
    $(id).material_select();
}
