require 'rails_helper'

RSpec.describe "dailyforms/index", type: :view do
  before(:each) do
    assign(:dailyforms, [
      Dailyform.create!(
        :yesterday => "MyText",
        :today => "MyText",
        :blockage => "MyText"
      ),
      Dailyform.create!(
        :yesterday => "MyText",
        :today => "MyText",
        :blockage => "MyText"
      )
    ])
  end

  it "renders a list of dailyforms" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
