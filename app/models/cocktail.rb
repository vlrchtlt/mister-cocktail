class Cocktail < ActiveRecord::Base
  has_many dose dependent: :destroy
end
