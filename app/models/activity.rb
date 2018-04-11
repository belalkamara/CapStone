class Activity < ApplicationRecord
  has_many :types
  accepts_nested_attributes_for :types, 
                                reject_if: lambda { |attr| attr['name'].blank? }

  include ImagePlaceholder
  enum status: { draft: 0, live: 1, ended: 2 }

  validates_presence_of :title, :miles, :days, :image, :status, :description

  def self.draft
    where(status: 'draft')
  end

  def self.live
    where(status: 'live')
  end

  after_initialize :set_defaults
  after_update :set_status

  def set_defaults
    self.image ||= ImagePlaceholder.image_generator(height:'300', width:'200')
  end

  def set_status
    self.update_column(:status, 2) if self.days == 0
  end
end


# Need to figure out better call for set status... How it is now it crashes every time you set a new event