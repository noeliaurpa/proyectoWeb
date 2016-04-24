class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :null_session

    before_action :restrict_access

    private

    def restrict_access
        authenticate_or_request_with_http_token do |token, options|
            @data_session = Session.find_by(access_token: token)
            if !@data_session.nil?
                if @data_session.expires_at > Time.now
                    @data_session.update(expires_at: 30.minutes.from_now.to_s)
                    # Session.exists?(access_token: token)
                    true
                else
                    @data_session.destroy

                end
            end
        end
    end
end
