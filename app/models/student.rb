class Student < ApplicationRecord
    validates :name, presence: true
    validates :major, presence: true 
    validate :age_range 

    def age_range 
        unless(age>= 18)
            errors.add(:age, "Must be above 18 years")
        end
    end
    
    belongs_to :instructor
end
