class Event < ApplicationRecord
  belongs_to :host
  belongs_to :venue, optional: true
  has_many :guests
  validates :name, presence: true
  accepts_nested_attributes_for :venue, :reject_if => :all_blank


  def venue_attributes=(params)
    if !params[:name].blank? && !params[:location].blank?
      venue = Venue.find_or_create_by(name: params[:name].titleize, location: params[:location].titleize)
      self.venue = venue
    end
  end


end
