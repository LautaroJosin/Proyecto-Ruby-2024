class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to set_products_amount_sales_path(client_id: @client.id), notice: "Client #{@client.name} #{@client.lastname} was successfully created."
    else
      pp @client.errors.full_messages
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :lastname, :dni, :phone)
  end
end
