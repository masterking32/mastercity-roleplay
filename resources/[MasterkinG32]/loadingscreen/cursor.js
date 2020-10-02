window.onload = function() 
{
    document.body.addEventListener("mousemove", function(event)
  {
      var x = event.pageX - 6 + "px"
      var y = event.pageY + "px"
    document.getElementById("cursor").style.left = x;
    document.getElementById("cursor").style.top = y;
  })
};