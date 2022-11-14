class PartnersController < ApplicationController
  before_action :set_partner, only: %i[ show update destroy ]
  before_action :set_url

  # GET /partners
  def index
    @partners = Partner.all.order('id DESC')
    render json: @partners.map { |partner| {image: partner.image.url, detail: partner } } 
  end

  # GET /partners/1
  def show

    render json: @partner.image
  end

  # POST /partners
  def create
    @partner = Partner.new(partner_params)
    @partner.image.attach(params[:image])
    if @partner.save
      render json: @partner, status: :created, location: @partner
    else
      render json: @partner.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /partners/1
  def update
    @partner.image.attach(params[:image])
    if @partner.update(partner_params)
      render json: @partner
    else
      render json: @partner.errors, status: :unprocessable_entity
    end
  end

  # DELETE /partners/1
  def destroy
    @partner.destroy
  end

  def set_url
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:partner).permit(:instagram, :enabled, :image, :name, :discount, :description, :target, :order)
    end
end
