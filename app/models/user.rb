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


  def my_level
    if (0..100).include?(self.pontuacao)
      'Saidinho'
    elsif (101..300).include?(self.pontuacao)
      'Baladeiro'
    elsif (301..900).include?(self.pontuacao)
      'Baladeiro Supremo'
    else
      'Rei do Camarote'
    end
  end

  def point_of_presence
    increment_point 10
  end

  def point_of_comment
    increment_point 2
  end

  def point_for_create_event
    increment_point 50
  end

  private
  def increment_point(valor)
    self.pontuacao = self.pontuacao + valor
    self.save
  end

end
