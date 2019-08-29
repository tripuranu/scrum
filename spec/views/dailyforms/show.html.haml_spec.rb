require 'rails_helper'

RSpec.describe "dailyforms/show", type: :view do
  before(:each) do
    @dailyform = assign(:dailyform, Dailyform.create!(
      :yesterday => "MyText",
      :today => "MyText",
      :blockage => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
