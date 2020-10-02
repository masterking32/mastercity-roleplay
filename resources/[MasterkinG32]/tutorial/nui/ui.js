
$(document).ready(function(){
 
 window.addEventListener( 'message', function( event ) {
        var item = event.data;
  
        if ( item.showPlayerMenu == true ) {
	$('body').css('background-color','transparent');
	$('body').css('background','url("background.jpg") no-repeat center center fixed');
          
$('.container-fluid').css('display','block');
        } else if ( item.showPlayerMenu == false ) { // Hide the menu 
           
$('.container-fluid').css('display','none');
$('body').css('background-color','transparent important!');
	$("body").css("background-image","none");

        }
    } );

    $("#spawnbtn").click(function(){
        $.post('http://tutorial/spawnButton', JSON.stringify({}));
	
    });


})


