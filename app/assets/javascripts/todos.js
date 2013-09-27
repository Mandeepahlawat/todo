$(document).on('click','.task_check', function(){
	var data_id = $(this).data('id');
	var data = $(this).siblings('.title').html();
	$.ajax({
		type: "POST",
		url: "/status",
		data: {id: data_id, text: data}
	});
});

$(document).on('mouseover','.task_check',function(){
	$('.delete_button').css("visibility","hidden");
	$(this).siblings(".delete_button").css("visibility","visible");
	return false;
});

$(document).on('mouseover','.title',function(){
	$('.delete_button').css("visibility","hidden");
	$(this).siblings(".delete_button").css("visibility","visible");
	return false;
});

$(document).on('mouseleave','.todo_link',function(){
	$(this).children('.delete_button').css("visibility","hidden");
});

$(document).on('mouseenter','.todo_drop_icon',function(){
	$(this).parents(".delete_button").parents(".todo_link").parents(".task").parents("#incomplete_tasks").sortable();
  $(this).parents(".delete_button").parents(".todo_link").parents(".task").parents("#incomplete_tasks").disableSelection();
	return false;
});

$(document).on('mouseenter','.todo_drop_icon',function(){
	$(this).parents(".delete_button").parents(".todo_link").parents(".task").parents("#completed_tasks").sortable();
  $(this).parents(".delete_button").parents(".todo_link").parents(".task").parents("#incompleted_tasks").disableSelection();
	return false;
});

$(document).on('mouseover','#todos_submit a',function(){
	$(this).css({"background":"#ff0000","color":"#ffffff"});
	return false;
});

$(document).on('mouseleave','#todos_submit a',function(){
	$(this).css({"background":"transparent","color":"#ff0000"});
	return false;
});

$(document).on('click','#todos_submit a',function(){
	$("#hidden_form").hide();
	$(".todos_title").val("");
	return false;
});

$(document).on('click','#add_item',function(){
	$("#hidden_form").show();
	return false;
});


