class TextApp < ActiveRecord::Base
	  validates :phone_num, presence: true, length: { maximum: 255 }
	  validates_format_of :phone_num, :with => /\A(\+1|1)?([2-9]\d\d[2-9]\d{6})\z/, message: 'Phone number is incorrectly formatted, try YYY-YYY-YYYY' , on: :create
end

class TextApp < ActiveRecord::Base
	before_validation(on: :create) do
    self.phone_num = phone_num.gsub(/[^\d]/, "") if attribute_present?("phone_num")
  end
end

class TextApp < ActiveRecord::Base
end

