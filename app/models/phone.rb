class Phone < ApplicationRecord
	validates_presence_of :number
	validates_uniqueness_of :number
	validates_numericality_of :number, greater_than: 1111111111, less_than_or_equal_to: 9999999999


	
	def assing_phone_number(phone_number=nil)
		if phone_number.present?
			self.number = phone_number
		end
		return if valid?

		invalid_number = true
		
		while (invalid_number) do
			self.number = random_phone_number
			invalid_number=false if valid? 
		end 
	end

	def random_phone_number
		rand(1111111111...9999999999)
	end

end
