class Submissio < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :nullify
  has_many :questions, through: :answers
  has_many :sections, through: :questions
end
