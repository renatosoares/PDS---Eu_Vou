class Event < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :creator, class_name: 'User'
end
