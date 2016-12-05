$('#tasks[data-type!="done"]').prepend("<%= j(render @task) %>")
$('.new_task')[0].reset()
