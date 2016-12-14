class List < ApplicationRecord
  after_create :update_url
  #before_update :assign_url

  validates :nombre, presence: true
  validates :url,uniqueness: true
  has_many :tasks, dependent: :destroy,inverse_of: :list
  accepts_nested_attributes_for :tasks,:update_only => true
  #validates_associated :tasks
  after_create :assign_url
  def to_param
     url
  end
   
  private
  def assign_url
    self.url = "#{ nombre.parameterize }"
  end
 
  def update_url
    update_attributes url: assign_url
  end
end
