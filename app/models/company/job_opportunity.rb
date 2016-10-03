class  Company::JobOpportunity < ActiveRecord::Base

  # concerns

  # callbacks

  belongs_to :company

  # relationships

  has_many :events, foreign_key: :company_job_opportunity_id, dependent: :destroy
  has_many :skill_assignments, as: :skillable, dependent: :destroy
  has_many :skills, through: :skill_assignments
  has_many :qualification_assignments, as: :qualifiable, dependent: :destroy
  has_many :qualifications, through: :qualification_assignments

  # validations
  validates :title, presence:true, length: { maximum: 255 }
  validates :shift, presence:true, length: { maximum: 255 }
  validates :description, presence:true, length: { maximum: 65535 }
  validates :number_of_positions, presence:true

  #constants
  STATUS = ["OPEN","CLOSED"]


  # class methods/scope
  def self.get_recent_jobs(job_count=5)
    Company.joins(:job_opportunities).select('companies.name','company_job_opportunities.title','company_job_opportunities.id','company_job_opportunities.created_at').distinct.order(:created_at).limit(job_count)
  end

end
