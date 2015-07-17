module Validators
	class Validators::NameValidator < ActiveModel::Validator

    def validate(instance)
    	
      instance.errors.add(:name, "Enter firstname and surname") unless instance.name.split(' ').size ==2
    end
  end
end