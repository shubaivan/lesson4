$('#lists').prepend("<%= j(render @list) %>")
$('form')[0].reset()
