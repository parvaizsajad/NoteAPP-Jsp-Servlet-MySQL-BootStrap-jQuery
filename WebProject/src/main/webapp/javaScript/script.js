
 $(document).ready(function(){

 $("#callAjax").on("keyup",function(){
	let search=$("#callAjax").val();
	console.log("hellop")

$.ajax({
  url: "Ajax",
  data: {
    name: search
  },
  success: function(result ) {
		if(search==""){$("#htag").html("");}else{
    $("#htag").html( result );
    }
  }
});	


})

//end search


console.log("hello")
});