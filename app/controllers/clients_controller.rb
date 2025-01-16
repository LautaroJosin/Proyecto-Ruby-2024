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
      pp @client.errors.full_messages
      render :new
    end
  end

  def destroy
    @client = Client.find(params[:id])
    authorize! :destroy, @client
    @client.destroy
    flash.now[:notice] = "Client was successfully deleted"
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:name, :lastname, :dni, :phone)
  end
end
