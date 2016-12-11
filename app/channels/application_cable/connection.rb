module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      verifier = ActiveSupport::MessageVerifier.new('jsdhf')
      id = verifier.verified(cookies.signed[:user_id])
      if (current_user = User.find_by(id: id))
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
