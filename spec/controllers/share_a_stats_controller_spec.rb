require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ShareAStatsController do

  # This should return the minimal set of attributes required to create a valid
  # ShareAStat. As you add validations to ShareAStat, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShareAStatsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all share_a_stats as @share_a_stats" do
      share_a_stat = ShareAStat.create! valid_attributes
      get :index, {}, valid_session
      assigns(:share_a_stats).should eq([share_a_stat])
    end
  end

  describe "GET show" do
    it "assigns the requested share_a_stat as @share_a_stat" do
      share_a_stat = ShareAStat.create! valid_attributes
      get :show, {:id => share_a_stat.to_param}, valid_session
      assigns(:share_a_stat).should eq(share_a_stat)
    end
  end

  describe "GET new" do
    it "assigns a new share_a_stat as @share_a_stat" do
      get :new, {}, valid_session
      assigns(:share_a_stat).should be_a_new(ShareAStat)
    end
  end

  describe "GET edit" do
    it "assigns the requested share_a_stat as @share_a_stat" do
      share_a_stat = ShareAStat.create! valid_attributes
      get :edit, {:id => share_a_stat.to_param}, valid_session
      assigns(:share_a_stat).should eq(share_a_stat)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ShareAStat" do
        expect {
          post :create, {:share_a_stat => valid_attributes}, valid_session
        }.to change(ShareAStat, :count).by(1)
      end

      it "assigns a newly created share_a_stat as @share_a_stat" do
        post :create, {:share_a_stat => valid_attributes}, valid_session
        assigns(:share_a_stat).should be_a(ShareAStat)
        assigns(:share_a_stat).should be_persisted
      end

      it "redirects to the created share_a_stat" do
        post :create, {:share_a_stat => valid_attributes}, valid_session
        response.should redirect_to(ShareAStat.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved share_a_stat as @share_a_stat" do
        # Trigger the behavior that occurs when invalid params are submitted
        ShareAStat.any_instance.stub(:save).and_return(false)
        post :create, {:share_a_stat => { "title" => "invalid value" }}, valid_session
        assigns(:share_a_stat).should be_a_new(ShareAStat)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ShareAStat.any_instance.stub(:save).and_return(false)
        post :create, {:share_a_stat => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested share_a_stat" do
        share_a_stat = ShareAStat.create! valid_attributes
        # Assuming there are no other share_a_stats in the database, this
        # specifies that the ShareAStat created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ShareAStat.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => share_a_stat.to_param, :share_a_stat => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested share_a_stat as @share_a_stat" do
        share_a_stat = ShareAStat.create! valid_attributes
        put :update, {:id => share_a_stat.to_param, :share_a_stat => valid_attributes}, valid_session
        assigns(:share_a_stat).should eq(share_a_stat)
      end

      it "redirects to the share_a_stat" do
        share_a_stat = ShareAStat.create! valid_attributes
        put :update, {:id => share_a_stat.to_param, :share_a_stat => valid_attributes}, valid_session
        response.should redirect_to(share_a_stat)
      end
    end

    describe "with invalid params" do
      it "assigns the share_a_stat as @share_a_stat" do
        share_a_stat = ShareAStat.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ShareAStat.any_instance.stub(:save).and_return(false)
        put :update, {:id => share_a_stat.to_param, :share_a_stat => { "title" => "invalid value" }}, valid_session
        assigns(:share_a_stat).should eq(share_a_stat)
      end

      it "re-renders the 'edit' template" do
        share_a_stat = ShareAStat.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ShareAStat.any_instance.stub(:save).and_return(false)
        put :update, {:id => share_a_stat.to_param, :share_a_stat => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested share_a_stat" do
      share_a_stat = ShareAStat.create! valid_attributes
      expect {
        delete :destroy, {:id => share_a_stat.to_param}, valid_session
      }.to change(ShareAStat, :count).by(-1)
    end

    it "redirects to the share_a_stats list" do
      share_a_stat = ShareAStat.create! valid_attributes
      delete :destroy, {:id => share_a_stat.to_param}, valid_session
      response.should redirect_to(share_a_stats_url)
    end
  end

end
