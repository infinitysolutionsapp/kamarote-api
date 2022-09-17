class UsersController < ApplicationController
    # before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]
    # GET /users
    def index
      # authorize! :read, @users
      @users = User.all
      render json: @users, status: :ok
    end
  
    # GET /users/{username}
    def show
      render json: {user: @user, account: Account.where(user_id: @user.id)}, status: :ok
    end

    def me
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
      
      render json: {user: @current_user, account: Account.where(user_id: @current_user.id)}, status: :ok
    end
  
    # params.require(:account).permit(:balance, :user_id, :agency, :account)/////////////////////////////////

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        @account = Account.new({ balance: 0, agency: "teste" , account: "teste", user_id: @user.id})
        @account.save

        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    # PUT /users/{username}
    def update
      unless @user.update(user_params)
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    # DELETE /users/{username}
    def destroy
      @user.destroy
    end
  
    private
  
    def find_user
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end
  
    def user_params
      params.permit(
        :avatar, :name, :id, :username, :email, :password, :password_confirmation, :cell, :tel, :document, :street, :city, :state, :zip_code  
      )
    end
  end
