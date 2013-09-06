require 'spec_helper'

describe "share_a_stats/index" do
  before(:each) do
    assign(:share_a_stats, [
      stub_model(ShareAStat,
        :title => "Title",
        :message => "MyText",
        :image => "Image",
        :scholarship => false,
        :tip => "Tip",
        :mc_alpha => 1,
        :mc_beta => 2,
        :redirect => "Redirect",
        :redirect_message => "MyText",
        :campaign_id => 3,
        :color_scheme => "Color Scheme",
        :logo => "Logo",
        :logo_text => "Logo Text",
        :shortform_image => "Shortform Image",
        :shortform_bucket => "Shortform Bucket",
        :sponsor_image => "Sponsor Image",
        :published => false
      ),
      stub_model(ShareAStat,
        :title => "Title",
        :message => "MyText",
        :image => "Image",
        :scholarship => false,
        :tip => "Tip",
        :mc_alpha => 1,
        :mc_beta => 2,
        :redirect => "Redirect",
        :redirect_message => "MyText",
        :campaign_id => 3,
        :color_scheme => "Color Scheme",
        :logo => "Logo",
        :logo_text => "Logo Text",
        :shortform_image => "Shortform Image",
        :shortform_bucket => "Shortform Bucket",
        :sponsor_image => "Sponsor Image",
        :published => false
      )
    ])
  end

  it "renders a list of share_a_stats" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Tip".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Redirect".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Color Scheme".to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
    assert_select "tr>td", :text => "Logo Text".to_s, :count => 2
    assert_select "tr>td", :text => "Shortform Image".to_s, :count => 2
    assert_select "tr>td", :text => "Shortform Bucket".to_s, :count => 2
    assert_select "tr>td", :text => "Sponsor Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
