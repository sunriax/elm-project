function loadDoc(Page, Query, ElementId) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange=function() {
    if (this.readyState == 4 && this.status == 200) {
    	if(ElementId != null)
    	{
			document.getElementById(ElementId).innerHTML = this.responseText;
			}
			else
			{
				return this.responseText;
			}
		
    }
  };
  xhttp.open("POST", Page + "?" + Query, true);
  xhttp.send();
}

function move(ElementId) {
			var elem = document.getElementById(ElementId); 
			var width = 1;

	function frame() {
		if (width >= 100) {
			clearInterval(id);
		}
		else
		{
			width++; 
			elem.style.width = width + '%'; 
		}
	}

	var id = setInterval(frame, 100);
}
