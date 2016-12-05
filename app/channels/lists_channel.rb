# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ListsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lists_channel_#{params[:list]}"
    # TODO
    # ActionCable.server.broadcast('ListsChannel', user: current_user.id)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
