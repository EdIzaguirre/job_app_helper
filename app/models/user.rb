class User < ApplicationRecord
  has_many :job_apps, dependent: :destroy

  validates :name, presence: true
end
