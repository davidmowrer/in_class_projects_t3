require 'rails_helper'

RSpec.describe "people/new", :type => :view do
  before(:each) do
    assign(:person, Person.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :address_line_one => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input#person_first_name[name=?]", "person[first_name]"

      assert_select "input#person_last_name[name=?]", "person[last_name]"

      assert_select "input#person_email[name=?]", "person[email]"

      assert_select "input#person_address_line_one[name=?]", "person[address_line_one]"

      assert_select "input#person_city[name=?]", "person[city]"

      assert_select "input#person_state[name=?]", "person[state]"

      assert_select "input#person_zip_code[name=?]", "person[zip_code]"
    end
  end
end
