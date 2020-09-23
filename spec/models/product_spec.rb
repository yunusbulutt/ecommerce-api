require 'rails_helper'

RSpec.describe Product, type: :model do

it { should belong_to(:customer) }

 it { should validate_presence_of(:title) }
 it { should validate_presence_of(:price) }
 it { should validate_presence_of(:quantity) }

end
