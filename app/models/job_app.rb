class JobApp < ApplicationRecord
  has_many :resumes, dependent: :destroy
end
