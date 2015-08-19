// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require underscore-min
//= require gmaps/google
//= require_tree .


var i;
myVar = null;

searchFunction();

function searchFunction() {
  clearTimeout(myVar);
  myVar = setTimeout(autoCompleteRequest, 1000);
}

function autoCompleteRequest() {

  $("#input-box").autocomplete({
    source: gon.conames
  });
 
}


function search() {
  i = $.inArray( $("#input-box").val(), gon.conames );
  if (i == -1){
    window.alert('Company not found!');
   }else{
   window.location.href = "/companies/" + gon.conperm[i];
  }
};



    

    
