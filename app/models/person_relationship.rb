class PersonRelationship < ApplicationRecord
  belongs_to :person_one
  belongs_to :person_two
end
