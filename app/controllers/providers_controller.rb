class ProvidersController < ApplicationController
  def index
    @providers = Provider.all
  end

  def new
    #binding.pry
    render "form"
  end

  def create
    @provider = Provider.new(provider_params)
    @provider.user_id = current_user.id
    if @provider.save
      redirect_to @provider, notice: "D.O.C Successfully Added!"
    else
      flash[:message] = "Something did not validate."
      render 'new'
    end
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def edit
    @provider = Provider.find(params[:id])
    render "form"
  end

  private
  def provider_params
    params.require(:provider).permit(
    :first_name,
    :last_name,
    :organization_name,
    :kind,
    :address_line1,
    :address_line2,
    :postal_code,
    :city,
    :province,
    :phone,
    :waiting_period,
    :user_id,
    :image,
    )
  end 

end
