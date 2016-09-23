class Company::Event < ActiveRecord::Base

  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # TODO
  # after_create :send_email_to_candidates

  # associations
  belongs_to :job_opportunity
  has_one :location, as: :locatable

  # validations
  validates :event_type, presence:true, length: { :maximum => 255}
  validates :date_time, presence:true
  validates :duration, presence:true

end