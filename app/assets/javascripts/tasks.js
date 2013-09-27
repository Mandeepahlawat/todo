$(document).on('click','#create_button,#show_new_task', function(){
	$('.swap_from').hide();
	$('.swap_to').show();
	$('#create_button').hide();	
	return false;
});

$(document).on('mouseover','.show_delete',function(){
	$('.delete_button').css("visibility","hidden");
	$(this).parent(".link").siblings(".delete_button").css("visibility","visible");
	return false;
});

$(document).on('mouseleave','.delete_button',function(){
	$(this).css("visibility","hidden");
});

$(document).on('mouseleave','.task_category',function(){
	$(this).children('.delete_button').css("visibility","hidden");
});

// $(document).on('mouseover','.container_data', function(){
// 	$(this).children("a").click(function(){
// 		$('.swap_to').hide();
// 		$('.swap_from').show();
// 		$('#create_button').show();
// 		return false;
// 	});	
// });



$(document).on('mouseenter','.drop_icon',function(){
	$(this).parent('.delete_button').parent('.task_category').parent('.task_categories').sortable();
  $(this).parent('.delete_button').parent('.task_category').parent('.task_categories').disableSelection();
	return false;
});


