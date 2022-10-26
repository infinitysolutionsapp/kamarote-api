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
      address_data = {
        street:   @user[:street],
        city:     @user[:city],
        state:    @user[:state],
        zip_code: @user[:zip_code]

      }
      render json: {image: @user.image.url, address: address_data,  user: @user, account: Account.where(user_id: @user.id)}, status: :ok
    end

    def me
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
      
      render json: {address: {street: @current_user[:street], city: @current_user[:city], state: @current_user[:state], zip_code: @current_user[:zip_code]  }, user: @current_user, account: Account.where(user_id: @current_user.id)}, status: :ok
    end
  
    # params.require(:account).permit(:balance, :user_id, :agency, :account)/////////////////////////////////

    # POST /users
    def create
      @user = User.new(user_params)
      @user.image.attach(params[:image])

      if @user.save
        @account = Account.new({ discount_balance: 0 ,balance: 0, agency: "0110" , account: @user.id.to_s.rjust(7, "0"), user_id: @user.id})
        @account.save

        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    # PUT /users/{username}
    def update
      @user.image.attach(params[:image])
      unless @user.update(user_params)
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    def set_url
      ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
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
