require 'spec_helper'

describe ShareAStat do
  describe 'validations' do
    subject { FactoryGirl.build(:share_a_stat) }
    it { should be_valid }
    it { should respond_to(:title) }
    it { should respond_to(:title) }
    it { should respond_to(:message) }
    it { should respond_to(:image) }
    it { should respond_to(:tip) }
    it { should respond_to(:mc_alpha) }
    it { should respond_to(:mc_beta) }
    it { should respond_to(:redirect) }
    it { should respond_to(:redirect_message) }
    it { should respond_to(:color_scheme) }
    it { should respond_to(:published) }
    it { should respond_to(:rules) }
  end
end
