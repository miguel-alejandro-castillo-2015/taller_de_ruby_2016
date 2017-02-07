class List < ApplicationRecord
  validates :nombre, presence: true
  validates :url,presence: true,uniqueness: true
  has_many :tasks, dependent: :destroy,inverse_of: :list
  accepts_nested_attributes_for :tasks,:update_only => true
  before_validation :assign_url ,on: :create
  def to_param
     url
  end
   
  private
  def assign_url
    self.url = "#{ nombre.tr(" ","-") }"
  end

end
