# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready( ->
	$('.tasks').sortable(
		handle: '.handle',
		dropOnEmpty: false,
		axix: 'y',
		cursor: 'pointer',
		opacity: 0.4,
		scroll: true,
		items: 'li',
		update: ->
			$.ajax(
				type: 'post',
				url: $('#list_id').val()+'/tasks/'+$('#task_id').val()+'/sort',
				data: $('.tasks').sortable('serialize'),
				dataType: 'script',
				complete: (request) ->
					$('.tasks').effect('highlight')
			)
	)
)