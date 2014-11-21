class Person < ActiveRecord::Base
  validates :first_name, :last_name, :address_line_one, :city, :state, :zip_code, presence: true
  validates :first_name, :last_name, :city, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates_each :first_name, :last_name, :city do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[a-z]/
  end
  validates :address_line_one, length: {maximum: 65,
    too_long: "%{count} characters is the maximum allowed" }
  validates :email, uniqueness: true, :allow_blank => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :allow_blank => true
  validates :state, format: { with: /\A[A-Z]+\z/,
                              message: "only allows 2 Capital letters" }
  validates :state, inclusion: { in: %w(AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE
                                        NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY),
                                 message: "field only allows US States" }
  validates :zip_code, length: {minimum: 5, maximum: 5}
  validates :zip_code, numericality: true
end
