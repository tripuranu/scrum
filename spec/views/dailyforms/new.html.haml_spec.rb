require 'rails_helper'

RSpec.describe "dailyforms/new", type: :view do
  before(:each) do
    assign(:dailyform, Dailyform.new(
      :yesterday => "MyText",
      :today => "MyText",
      :blockage => "MyText"
    ))
  end

  it "renders new dailyform form" do
    render

    assert_select "form[action=?][method=?]", dailyforms_path, "post" do

      assert_select "textarea[name=?]", "dailyform[yesterday]"

      assert_select "textarea[name=?]", "dailyform[today]"

      assert_select "textarea[name=?]", "dailyform[blockage]"
    end
  end
end
