require 'spec_helper'
describe ShareAStatsController do
  let(:sas) { FactoryGirl.create(:share_a_stat) }

  describe 'GET #index' do
  	before { get :index }
  	it 'responds successfully' do
      expect(response).to be_success
      expect(response.status).to eq 200
    end
    it 'shows share a stats' do
      expect(assigns(:share_a_stats)).to include(sas)
    end
  end

  describe 'GET #show' do
    before { get :show, { id: sas.id } }
    it 'responds successfully' do
      expect(response).to be_success
      expect(response.status).to eq 200
    end
    it 'shows the assigned share a stat' do
      expect(assigns(:share_a_stat)).to eq(sas)
    end
    it 'prepares a new post' do
      expect(assigns(:post)).to be_an_instance_of(ShareAStatPost)
    end
  end

  describe 'GET #new' do
    before { get :new }
    describe 'session validation' do
      it 'forces you to log in if you are not an admin' do
        expect(response).to redirect_to login_path
      end
      it 'responds successfully if you are an admin' do
        expect(response).to be_success
        expect(response.status).to eq 200
      end
    end
  end
end
