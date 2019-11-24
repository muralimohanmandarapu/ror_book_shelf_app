module Api
	module V
		class SearchController < ApplicationController
			skip_before_action :verify_authenticity_token
			def get_info_books
				@books = $redis.get(params[:keyword])  
        if @books.nil? 
          books = Book.search(params[:keyword])
          $redis.set(params[:keyword],books)
          $redis.expire(params[:keyword], 1.week.to_i)
          @books = $redis.get(params[:keyword])
        end
				render json: @books, status: :ok
			end
		end
	end
end
 