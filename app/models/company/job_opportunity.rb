class  Company::JobOpportunity < ActiveRecord::Base

  # concerns

  # callbacks
    belongs_to :company

  # relationships
    has_many :events, foreign_key: :company_job_opportunity_id
    has_many :skill_assignments, as: :skillable
    has_many :skills, through: :skill_assignments
    has_many :qualification_assignments, as: :qualifiable
    has_many :qualifications, through: :qualification_assignments

  # validations
  validates :title, presence:true, length: { maximum: 255 }
  validates :shift, presence:true, length: { maximum: 255 }
  validates :description, presence:true, length: { maximum: 65535 }
  validates :number_of_positions, presence:true

end