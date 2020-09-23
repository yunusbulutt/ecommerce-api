class Product < ApplicationRecord

    belongs_to :customer

    validates_presence_of :title, :price, :quantity 

end
