class Ingredient < ActiveRecord::Base
  has_many dose dependent: :destroy
end
