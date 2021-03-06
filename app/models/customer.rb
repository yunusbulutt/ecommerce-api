class Customer < ApplicationRecord

    has_many :products, dependent: :destroy

    validates_presence_of :name, :surname, :email, :phone

end
