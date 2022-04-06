class ApplicationController < ActionController::Base
  def self.current_user
    User.take
  end
end
