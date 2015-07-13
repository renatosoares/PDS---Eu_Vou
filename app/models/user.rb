class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  has_and_belongs_to_many :events
  has_many :events_created, class_name: 'Event'
  scope :admins, -> { where(admin: true) }
  validates_presence_of :nome

end
