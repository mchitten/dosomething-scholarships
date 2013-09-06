require 'spec_helper'

describe "share_a_stats/show" do
  before(:each) do
    @share_a_stat = assign(:share_a_stat, stub_model(ShareAStat,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Image/)
    rendered.should match(/false/)
    rendered.should match(/Tip/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Redirect/)
    rendered.should match(/MyText/)
    rendered.should match(/3/)
    rendered.should match(/Color Scheme/)
    rendered.should match(/Logo/)
    rendered.should match(/Logo Text/)
    rendered.should match(/Shortform Image/)
    rendered.should match(/Shortform Bucket/)
    rendered.should match(/Sponsor Image/)
    rendered.should match(/false/)
  end
end
