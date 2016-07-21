class Item < ApplicationRecord
  belongs_to :list
  belongs_to :item_creator, class_name: 'User'
  belongs_to :purchaser, class_name: 'User'
  
end
