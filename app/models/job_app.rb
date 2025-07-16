class JobApp < ApplicationRecord
  has_many :resumes, dependent: :destroy
  belongs_to :user

  validates :title, :company_name, presence: true
end
