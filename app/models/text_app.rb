class TextApp < ActiveRecord::Base
	  validates_format_of :phone_num, presence: true, :with => /\A(\+1|1)?([2-9]\d\d[2-9]\d{6})\z/, message: 'This number isn\'t formatted properly, try it like 555-555-5555' , on: :create
end

class TextApp < ActiveRecord::Base
	before_validation(on: :create) do
    self.phone_num = phone_num.gsub(/[^\d]/, "") if attribute_present?("phone_num")
  end
end

class TextApp < ActiveRecord::Base
end

