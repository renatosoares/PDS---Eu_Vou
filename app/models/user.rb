class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_and_belongs_to_many :events
  has_many :events_created, foreign_key: "creator_id", class_name: 'Event'
  has_many :comments
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "64x64>" }, :default_url => "missing.png"


  validates_presence_of :nome
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_size :avatar, :less_than => 1.megabytes

  scope :admins, -> { where(admin: true) }

  def my_level      # gambiarras, depois tu melhora Marcelo ;)
    if (0..100).include?(self.pontuacao)
      @legendaIcone = 'Saidinho'            # <i class="fa fa-hand-peace-o"></i>
      @tipoIcone = 'fa fa-hand-peace-o'
    elsif (101..300).include?(self.pontuacao)
      @legendaIcone = 'Baladeiro'           # <i class="fa fa-bullhorn"></i>
      @tipoIcone = 'fa fa-bullhorn'
    elsif (301..900).include?(self.pontuacao)
      @legendaIcone = 'Baladeiro Supremo'   # <i class="fa fa-rocket"></i>
      @tipoIcone = 'fa fa-rocket'
    else
       @legendaIcone = 'Rei do Camarote'     # <i class="fa fa-diamond"></i>
      @tipoIcone = 'fa fa-diamond'
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
    self.pontuacao += valor
    self.save
  end

end
