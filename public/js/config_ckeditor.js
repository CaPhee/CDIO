$(document).ready(function(){
	if ($('textarea').length > 0) {
	  var data = $('.ckeditor');
	  $.each(data, function(i) {
	    CKEDITOR.replace(data[i].id)
	  });
	}
}); 

$(document).ready(function(){
  ......
  CKEDITOR.config.height = 800;
});