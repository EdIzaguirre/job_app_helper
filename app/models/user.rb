class User < ApplicationRecord
  has_many :job_apps, dependent: :destroy
end
