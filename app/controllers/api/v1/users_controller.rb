module Api
    module V1
        class UsersController < ApplicationController
            skip_before_action :restrict_access, only: [:create]
            before_action :set_user, only: [:show, :edit, :update, :destroy]
            before_action :user_params, only: [:create]

            def index
                users = User.all
                render json: users, status: 200
            end

            def show
                render json: @user, status: 200
            end

            def new
                @user = User.new
            end

            def create
                user = User.new(user_params)
                if user.save
                    render json: user , status: 201
                else
                    render json: user.errors, status: :unprocessable_entity
                end
            end

            def update
                if @user.update(user_params)
                    render json: @user, status: :ok
                else
                    render json: @user.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @user.destroy
                head :no_content
            end

            private
            # Use callbacks to share common setup or constraints between actions.
            def set_user
                @user = User.find(params[:id])
            end

            # Never trust parameters from the scary internet, only allow the white list through.
            def user_params
                params.require(:user).permit(:name, :username, :password, :password_confirmation, :subdomain )
            end


        end
    end
end
