require 'rails_helper'

RSpec.describe Cart, type: :model do
  
    it { should belong_to(:customer) }
    it { should belong_to(:product) }
    
end
