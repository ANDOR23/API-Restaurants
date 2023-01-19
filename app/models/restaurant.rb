class Restaurant < ApplicationRecord
    validates :rating, :inclusion => { :in => 0..4 }
    validates :idRestaurant, uniqueness: true
    self.primary_key = :idRestaurant
end
