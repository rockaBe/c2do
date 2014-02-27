# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('body').on "click", ".potzblitz", (event) ->
  event.preventDefault()
  event.stopPropagation()
  $.ajax
    url:          $(this).attr('href')
    data:         JSON.stringify({'todo': {'progress_state': $(this).attr('data-value')}})
    contentType:  'application/json'
    type:         'PUT'
    dataType:     'json'
    beforeSend: (xhr) => 
      xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
    success: (json) =>
      console.log "success"
  return false
    
$('#list-entries').on 'ajax:success', (event, data) ->
  if data.id
    elem = $('#list_'+data.id)
    if $("#todo-list-#{data.id}").length > 0
      $("#todo-list-#{data.id}").remove
      return true
    else
      temp = "<ul id='todo-list-#{data.id}' class='columns row'>"
      if data.todos
        for todo in data.todos 
          console.log "todo.update_state_url", todo.update_state_url
          temp += "<li id='todo_#{todo.id}_list' class='columns small-12'><a class='potzblitz icon-checked' id='todo_#{todo.id}' href='#{todo.update_state_url}' data-value='finished' data-remote='true'>finish</a><span class='icon-progress-state-#{todo.progress_state}'>#{todo.name}:: #{todo.due_at} </li>"
      temp += "<li class='new-todo columns small-12'><a href='#{elem.data('new-todo-url')}' class='button small'>new todo</a></li>"  
      temp += "</ul></div>"
      elem.append(temp)