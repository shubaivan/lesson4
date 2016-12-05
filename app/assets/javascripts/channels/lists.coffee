$(document).on 'turbolinks:load', ->
  return unless list = $('[data-list]')[0]
  id = list.getAttribute('data-list')
  App.lists = App.cable.subscriptions.create { channel: "ListsChannel", list: id },
    online: (data) ->
      console.log($("[data-coowner=#{data.user}"))

    connected: ->

    received: (data) ->
      return if $("[data-user=#{ data.user }]")[0]
      Turbolinks.visit(location.href)
