require 'spec_helper'

describe "share_a_stats/edit" do
  before(:each) do
    @share_a_stat = assign(:share_a_stat, stub_model(ShareAStat,
      :title => "MyString",
      :message => "MyText",
      :image => "MyString",
      :scholarship => false,
      :tip => "MyString",
      :mc_alpha => 1,
      :mc_beta => 1,
      :redirect => "MyString",
      :redirect_message => "MyText",
      :campaign_id => 1,
      :color_scheme => "MyString",
      :logo => "MyString",
      :logo_text => "MyString",
      :shortform_image => "MyString",
      :shortform_bucket => "MyString",
      :sponsor_image => "MyString",
      :published => false
    ))
  end

  it "renders the edit share_a_stat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", share_a_stat_path(@share_a_stat), "post" do
      assert_select "input#share_a_stat_title[name=?]", "share_a_stat[title]"
      assert_select "textarea#share_a_stat_message[name=?]", "share_a_stat[message]"
      assert_select "input#share_a_stat_image[name=?]", "share_a_stat[image]"
      assert_select "input#share_a_stat_scholarship[name=?]", "share_a_stat[scholarship]"
      assert_select "input#share_a_stat_tip[name=?]", "share_a_stat[tip]"
      assert_select "input#share_a_stat_mc_alpha[name=?]", "share_a_stat[mc_alpha]"
      assert_select "input#share_a_stat_mc_beta[name=?]", "share_a_stat[mc_beta]"
      assert_select "input#share_a_stat_redirect[name=?]", "share_a_stat[redirect]"
      assert_select "textarea#share_a_stat_redirect_message[name=?]", "share_a_stat[redirect_message]"
      assert_select "input#share_a_stat_campaign_id[name=?]", "share_a_stat[campaign_id]"
      assert_select "input#share_a_stat_color_scheme[name=?]", "share_a_stat[color_scheme]"
      assert_select "input#share_a_stat_logo[name=?]", "share_a_stat[logo]"
      assert_select "input#share_a_stat_logo_text[name=?]", "share_a_stat[logo_text]"
      assert_select "input#share_a_stat_shortform_image[name=?]", "share_a_stat[shortform_image]"
      assert_select "input#share_a_stat_shortform_bucket[name=?]", "share_a_stat[shortform_bucket]"
      assert_select "input#share_a_stat_sponsor_image[name=?]", "share_a_stat[sponsor_image]"
      assert_select "input#share_a_stat_published[name=?]", "share_a_stat[published]"
    end
  end
end
