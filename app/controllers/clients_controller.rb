class ClientsController < ApplicationController
  def index
    authorize! :index, Client
    @clients = Client.all
  end
  def new
    authorize! :new, Client
    @client = Client.new
  end

  def create
    authorize! :create, Client
    @client = Client.new(client_params)
    if @client.save
      redirect_to set_products_amount_sales_path(client_id: @client.id), notice: "Client #{@client.name} #{@client.lastname} was successfully created."
    else
      flash.now[:alert] = @client.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @client = Client.find(params[:id])
    authorize! :destroy, @client
    if @client.destroy
      flash[:notice] = "Client was successfully deleted"
      redirect_to clients_path
    else
      flash[:alert] = "It was not possible to delete this client because it has sales associated"
      @clients = Client.all
      render :index
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :lastname, :dni, :phone)
  end
end
