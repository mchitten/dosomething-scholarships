require 'spec_helper'

describe ShareAStatPostsController do
  describe 'POST #create' do
    before do
      Services::MobileCommons.stub(:subscribe)
      @sas = FactoryGirl.create(:share_a_stat)
      @valid_params = FactoryGirl.attributes_for(:share_a_stat_post, share_a_stat_id: @sas)
    end

    it 'Creates a new post' do
      expect { post :create, { :share_a_stat_post => @valid_params } }.to change(ShareAStatPost, :count).by(1)
    end
  end
end
