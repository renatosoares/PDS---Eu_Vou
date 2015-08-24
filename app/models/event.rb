class Event < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :users
  belongs_to :creator, class_name: 'User'
  has_many :comments
  has_attached_file :avatar, :styles => { :small => "200x200>",:medium => "300x300>", :large => "500x500>" }, :default_url => "missing.png"

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_size :avatar, :less_than => 2.megabytes

  scope :ativos, ->{ where('data >= ?', Time.now) }
  scope :expirados, ->{ where('data < ?', Time.now) }
end
