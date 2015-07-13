class Event < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :users
  belongs_to :creator, class_name: 'User'
end
