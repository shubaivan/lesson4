$(document).on 'turbolinks:load', ->
  return unless list = $('[data-list]')[0]
  id = list.getAttribute('data-list')
  App.lists = App.cable.subscriptions.create { channel: "ListsChannel", list: id },

    connected: ->
      @appear()

    received: (data) ->
      if (data.status)
        @addStatusClass(data.user, data.status)
      else
        return if $("[data-user=#{ data.user }]")[0]
        Turbolinks.visit(location.href)

    appear: ->
      @perform('appear')

    addStatusClass: (user, status) ->
      $("[data-person=#{user}]").removeClass();
      $("[data-person=#{user}]").addClass(status);
