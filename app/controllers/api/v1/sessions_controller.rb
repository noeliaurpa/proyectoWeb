module Api
    module V1
        class SessionsController < ApplicationController
            skip_before_action :restrict_access, only: [:create]

            def create
                if    user = User.find_by(username: params[:username])
                    if user && user.authenticate(params[:password])
                        session = Session.new(user_id: user.id, expires_at: 30.minutes.from_now.to_s)
                        if session.save
                            myToken = String.new("Your token is: " + session.access_token + " please copy and paste in the header")
                            render json: session, status: 200
                        else
                            render json: session.errors, status: :unprocessable_entity
                        end
                    else
                        render json: session.errors, status: :unprocessable_entity
                    end
                else
                    render  status: 400
                end
            end
            def destroy
                @data_session.destroy
                head :no_content
            end
        end
    end
end
