class ListMailer < ApplicationMailer
  default from: 'todo@example.com'

  def join_list_email(user, from, list)
    @user = user
    @list = list
    @from = from
    @url  = "http://localhost:3000/lists/#{list.id}/tasks"
    mail(to: @user.email, subject: 'List sharing')
  end

  def join_app_email(email, list)
    @email = email
    @list = list
    @url  = 'http://localhost:3000/signup'
    mail(to: @email, subject: 'Join ToDo App')
  end
end
