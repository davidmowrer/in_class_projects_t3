class City < ActiveRecord::Base
  validates :name, :population, :elevation, :state, presence: true
  validates :city, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates_each :city do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[a-z]/
  end
  validates :state, format: { with: /\A[A-Z]+\z/,
                              message: "only allows 2 Capital letters" }
  validates :state, inclusion: { in: %w(AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE
                                        NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY),
                                 message: "field only allows US States" }
  validates :population, numericality: {only_integer: true}
  validates :elevation, numericality: true
  validates :elevation,
           numericality: {
              greater_than_or_equal_to: 3315,
              if: ->(city) { city.state.upcase == 'CO'},
              message: 'is too low, lowest point in CO is 3315 feet.'
  }
end
