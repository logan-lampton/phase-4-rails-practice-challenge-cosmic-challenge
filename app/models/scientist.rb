class Scientist < ApplicationRecord
    has_many :missions, dependent: :destroy
    has_many :planets, through: :missions

    # must have a name, and a field_of_study
    validates :name, presence: true
    validates :field_of_study, presence: true

    # names must be unique
    validates :name, uniqueness: true
end
