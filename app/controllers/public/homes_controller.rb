class Public::HomesController < ApplicationController
	def top
		@genres = Genre.all
		@items = Item.all.last(4).reverse
	end

	def about

	end
end
