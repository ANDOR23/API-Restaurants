class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: %i[show update destroy update]
    
    #GET /restaurants/statistics
    #SENDING A SQL QUERY GIVING THE NECESSARY PARAMS: ?latitude=x&longitude=y&radius=z
    def stadistic
      @stadistics = Restaurant.find_by_sql(["SELECT COUNT(*) AS COUNT, AVG(rating) AS AVG, STDDEV(rating) AS STD FROM restaurants WHERE ST_Distance(coordinates, ST_MakePoint(?, ?)) <= ?",params[:longitude].to_f, params[:latitude].to_f, params[:radius].to_i])
      render json: @stadistics
    end

    #GET ALL THE RESTAURANTS
    #GET /restaurants
    def index
      @restaurants = Restaurant.all
      render json: @restaurants, status: :ok
    end

    #GET ONE RESTAURANT FOUND BY ITS ID
    #GET /restaurants/:id
    def show
      render json: @restaurant         
    end
    
    #POST A NEW RESTAURANT
    #POST /restaurants
    def create
      @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
          render json: {:Message => 'Restaurant created ;)',
                        :data => @restaurant}, status: :created
      else
          render json: { errors: @restaurant.errors.full_messages },
          status: :unprocessable_entity
      end
    end
    
    #PATCH AN EXISTING RESTAURANT FOUND BY ITS ID
    #PATCH /restaurants/:id
    def update
      unless @restaurant.update(restaurant_params)
      render json: { errors: @restaurant.errors.full_messages },
             status: :unprocessable_entity
      else 
        render json: {Message: 'Restaurant updated ;)'}, status: :ok
      end
    end
    
    #DELETE AN EXISTING RESTAURANT FOUND BY ITS ID
    #DELETE /restaurants/:id
    def destroy
      @restaurant.destroy
      render json: {Message: 'Restaurant deleted ;)'}, status: :no_content
    end
    
    private
    
    #NECESSARY PARAMS TO CREATE OR UPDATE A RESTAURANT
    def restaurant_params
      defaults = { coordinates:"POINT (#{params[:lng]} #{params[:lat]})" }
      params.permit(
        :idRestaurant, :rating, :name, :site, :email, :phone, :street, :city, :state, :lat, :lng, :coordinates
      ).reverse_merge(defaults)
    end

    #SET VARIABLE @restaurant WITH ID VALUE
    def set_restaurant
      @restaurant = Restaurant.find_by(idRestaurant: params[:id])
    end
   
end
