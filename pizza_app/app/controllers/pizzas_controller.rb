class PizzasController < ApplicationController
	def index
		@pizzas = []
		@drinks = []
		@sides = []
		@items = Item.all

		if session.has_key?(:cart_id)
			@cart = ShoppingCart.find(session[:cart_id])
		else
			@cart = ShoppingCart.create
		end
		for item in @items
			if item.type == 'Pizza'
				@pizzas.push item
			elsif item.type == 'Drink'
				@drinks.push item
			else
				@sides.push item
			end
		end
	end

	def show
		if params[:id] == 'showpizzalist' or request.url.include? 'showpizzalist'
			@items = Item.all
			render 'showpizzalist'
		else
			@item = Item.find(params[:id])
			if @item.availability == false
				@makeAvailability = 'true'
				@availabilityText = 'Enable'
			else
				@makeAvailability = 'false'
				@availabilityText = 'Disable'
			end
		end
	end

	def new
		@item = Item.new
	end

	def edit
		@item = Item.find(params[:id])
	end

	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to action: 'show', id: 'showpizzalist'
	end

	def update
		@item = Item.find(params[:id])

		if @item.update(item_params)
			redirect_to action: 'show', id: params[:id]
		else
			render 'edit'
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		@items = Item.all
		render 'showpizzalist'
	end

	

	private 
	def item_params
		params.require(:item).permit(:name, :type, :description, :price, :availability)
	end

	def destroy_multiple
		render plain: params[:item_ids].inspect
	end
end
