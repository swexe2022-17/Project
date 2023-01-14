class Company < ApplicationRecord
    has_many :salarys, dependent: :destroy
    has_many :works, dependent: :destroy
end
