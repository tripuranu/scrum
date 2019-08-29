require 'rails_helper'

RSpec.describe "dailyforms/edit", type: :view do
  before(:each) do
    @dailyform = assign(:dailyform, Dailyform.create!(
      :yesterday => "MyText",
      :today => "MyText",
      :blockage => "MyText"
    ))
  end

  it "renders the edit dailyform form" do
    render

    assert_select "form[action=?][method=?]", dailyform_path(@dailyform), "post" do

      assert_select "textarea[name=?]", "dailyform[yesterday]"

      assert_select "textarea[name=?]", "dailyform[today]"

      assert_select "textarea[name=?]", "dailyform[blockage]"
    end
  end
end
