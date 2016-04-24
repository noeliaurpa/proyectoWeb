module Api
    module V1
        class TransactionsController < ApplicationController
            before_action :set_transaction, only: [:show, :edit, :update, :destroy]
            before_action :data_confirm_transactions, only: [:create]

            def index
                transactions = Transaction.all
                render json: transactions, status: 200
            end

            def all_trnsactions
                transactions = Transaction.where(product_offered_id: @data_session.user_id)
            end

            def show
            end

            def create
                if !@product_req.nil? && !@product_offered.nil?
                    transaction = Transaction.new(product_req_id: @product_req.id,
                    product_offered_id: @product_offered.id)
                    cambio1 = @product_req.users_id
                    cambio2 = @product_offered.users_id
                    if @product_offered.update(state: "f", users_id: cambio1) &&  @product_req.update(state: "f", users_id: cambio2 )
                        if transaction.save
                            render json: transaction, status: :created
                        else
                            render json: transaction.errors, status: :unprocessable_entity
                        end
                    end
                end

            end
            #PUT/PATCH /transaction/1
            def update
                if transaction.update(transaction_params)
                    render :show, status: :ok
                else
                    render json: transaction.errors, status: :unprocessable_entity
                end
            end

            def destroy
                transaction.destroy
                head :no_content
            end

            private

            def data_confirm_transactions
                @product_req = Product.find_by(id: params[:product_req_id], state: true)
                @product_offered =  Product.find_by(id: params[:product_offered_id], state: true)
                if (@data_session.user_id !=  @product_offered.users_id)
                    mss = "Sorry but this product is not yours"
                    render json: mss, status: 404
                else if @data_session.user_id ==  @product_req.users_id
                    mss = "Sorry You can not change your own products"
                    render json: mss, status: 404
                end
            end

        end

        def set_transaction
            @transaction = Transaction.find(params[:id])
        end

        def transaction_params
            params.require(:transaction).permit(:product_req_id, :product_offered_id)
        end

    end
end
end
