var currentIndex = 0,
  items = $('.slidescontainer div'),
  itemAmt = items.length;

  var item = $('.slidescontainer div').eq(0);
items.hide();
item.css('display','inline-block');

if($('.slidescontainer div').eq(0)) { 
$("#spawnbtn").hide();
$("#left").hide();
}

function cycleItems() {
  var item = $('.slidescontainer div').eq(currentIndex);
  items.hide();
  item.css('display','inline-block');
}


$('#btnright').click(function() {
 
  currentIndex += 1;

  if(currentIndex == 0) { 
$("#spawnbtn").hide();
$("#left").show();
$("#right").show();
}
if (currentIndex == itemAmt-1) { 
$("#spawnbtn").show();
$("#right").hide();
$("#left").show();
}
 if (currentIndex < itemAmt-1  && currentIndex > 0) {
  $("#right").show();
$("#left").show();

  }
  cycleItems();
});

$('#btnleft').click(function() {
  if (currentIndex > 0) {
 	currentIndex -= 1;
  }
  if (currentIndex == 0) { 
  	$("#left").hide();
  }
  if (currentIndex < itemAmt-1 && currentIndex > 0) {
  $("#right").show();
$("#left").show();
$("#spawnbtn").hide();
  }

 	 if(currentIndex == 0) { 
  
$("#spawnbtn").hide();
$("#left").hide();
$("#right").show();
}
  /*if (currentIndex < 0) {
    currentIndex = itemAmt - 1;
  }*/
  cycleItems();
});