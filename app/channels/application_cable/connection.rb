module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      # Specify random id for sample code
      self.current_user = [*(1..100)].sample
    end
  end
end
