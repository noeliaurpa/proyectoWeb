module Api
    module V1
        class ProductsController < ApplicationController
            before_action :set_product, only: [:show, :edit, :update, :destroy]
            before_action :product_params, only: [:update]

            def index
                products = Product.all
                render json: products, status: 200
            end

            def all
                products = Product.where(users_id: @data_session.user_id)
                render json: products, status: 200
            end

            def other_Product_id
                products = Product.where.not(users_id: @data_session.user_id)
                render json: products, status: 200
            end

            def show
                render json: @product, status: 200
            end

            def create
                product = Product.new(name: params[:name], description: params[:description],
                state: params[:state], users_id: @data_session.user_id)
                if product.save
                    render json: product, status: 201
                else
                    render json: product.errors, status: :unprocessable_entity
                end
            end

            def update
                if @product.update(product_params)
                    render json: @product, status: :ok
                else
                    render json: @product.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @product.destroy
                head :no_content
            end

            private

            def set_product
                @product = Product.find(params[:id])
            end

            def product_params
                params.require(:product).permit(:name, :description, :state)
            end

        end
    end
end
