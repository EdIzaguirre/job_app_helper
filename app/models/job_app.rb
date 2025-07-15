class JobApp < ApplicationRecord
  has_many :resumes, dependent: :destroy

  validates :title, :company_name, presence: true
end
