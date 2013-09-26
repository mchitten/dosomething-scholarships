require 'spec_helper'
describe ShareAStatsController do
  let(:sas) { FactoryGirl.create(:share_a_stat) }
  let(:valid_params) { FactoryGirl.attributes_for(:share_a_stat) }
  let(:invalid_params) { {} }
  let(:valid_session) { { user_id: 1, user_roles: { 1 => 'authenticated user', 2 => 'administrator' } } }

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
    describe 'session validation' do
      it 'forces you to log in if you are not an admin' do
        get :new
        expect(response).to redirect_to '/login'
      end
      describe 'if you are an admin' do
        before { get :new, {}, valid_session }
        it 'responds successfully' do
          expect(response).to be_success
          expect(response.status).to eq 200
        end
        it 'assigns a new Share a Stat' do
          expect(assigns(:share_a_stat)).to be_a_new(ShareAStat)
        end
      end
    end
  end

  describe 'POST #create' do
    describe 'session validation' do
      describe 'if you are not admin' do
        before { post :create, { share_a_stat: valid_params } }
        it 'responds with 401 error' do
          expect(response.status).to eq 401
        end
        it 'returns an error' do
          res = JSON.parse(response.body)
          expect(res['error']).to eq "You don't have access to do that."
        end
      end
      describe 'if you are an admin' do
        it 'creates a new share a stat' do
          expect { post :create, { share_a_stat: valid_params }, valid_session }.to change(ShareAStat, :count).by(1)
        end
        it 'respond with a 302 header' do
          post :create, { share_a_stat: valid_params }, valid_session
          expect(response.status).to eq 302
        end
        it 'redirects to the social scholarship' do
          post :create, { share_a_stat: valid_params }, valid_session
          expect(response).to redirect_to share_a_stat_path(ShareAStat.last)
        end

        describe 'with invalid params' do
          it 'assigns a newly created but unsaved Share a Stat as @share_a_stat' do
            ShareAStat.any_instance.stub(:save).and_return(false)
            post :create, { share_a_stat: valid_params }, valid_session
            expect(assigns(:share_a_stat)).to be_a_new(ShareAStat)
          end

          it "re-renders the 'new' template" do
            ShareAStat.any_instance.stub(:save).and_return(false)
            post :create, { share_a_stat: valid_params }, valid_session
            expect(response).to render_template 'new'
          end
        end
      end
    end
  end

  describe 'GET #edit' do
    describe 'session validation' do
      it 'forces you to log in if you are not an admin' do
        get :edit, { id: sas.id }
        expect(response).to redirect_to '/login'
      end
      describe 'if you are an admin' do
        before { get :edit, { id: sas.id }, valid_session }
        it 'responds successfully' do
          expect(response).to be_success
          expect(response.status).to eq 200
        end
        it 'renders the edit template' do
          expect(response).to render_template('edit')
        end
      end
    end
  end

  describe 'PATCH #update' do
    describe 'session validation' do
      describe 'as a non-admin' do
        before { patch :update, { id: sas.id, share_a_stat: { title: 'banana' } } }
        it 'responds with 401 error' do
          expect(response.status).to eq 401
        end
        it 'returns an error' do
          res = JSON.parse(response.body)
          expect(res['error']).to eq "You don't have access to do that."
        end
      end

      describe 'as an admin' do
        it 'updates the share a stat' do
          ShareAStat.any_instance.should_receive(:update)
          patch :update, { id: sas.id, share_a_stat: { title: 'banana' } }, valid_session
        end

        it 'respond with a 302 header' do
          patch :update, { id: sas.id, share_a_stat: { title: 'banana' } }, valid_session
          expect(response.status).to eq 302
        end
        it 'redirects to the social scholarship' do
          patch :update, { id: sas.id, share_a_stat: { title: 'banana' } }, valid_session
          expect(response).to redirect_to share_a_stat_path(sas.reload)
        end

        describe 'with invalid params' do
          it 'assigns a newly created but unsaved Share a Stat as @share_a_stat' do
            ShareAStat.any_instance.stub(:save).and_return(false)
            patch :update, { id: sas.id, share_a_stat: { title: 'banana' } }, valid_session
            expect(assigns(:share_a_stat)).to eq sas
          end

          it "re-renders the 'edit' template" do
            ShareAStat.any_instance.stub(:save).and_return(false)
            patch :update, { id: sas.id, share_a_stat: { title: 'banana' } }, valid_session
            expect(response).to render_template 'edit'
          end
        end
      end
    end
  end
end
