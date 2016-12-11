# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ListsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lists_channel_#{params[:list]}"
  end

  def unsubscribed
    broadcast_status('offline')
  end

  def appear
    broadcast_status('online')
  end

  def broadcast_status(status)
    ActionCable.server.broadcast("lists_channel_#{params[:list]}",
                                 user: current_user.id,
                                 status: status)
  end
end
