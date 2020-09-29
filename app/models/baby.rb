class Baby < ApplicationRecord
    has_many :breastfeedings

    def to_s 
        name
    end
end
