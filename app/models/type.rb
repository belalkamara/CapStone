class Type < ApplicationRecord
  validates_presence_of :title

  has_many :activities
end
