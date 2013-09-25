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

    it 'is invalid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid without tip' do
      subject.tip = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid without body text' do
      subject.message = nil
      expect(subject).to_not be_valid
    end

    describe 'Mobile Commons Alpha Bucket' do
      it 'is required' do
        subject.mc_alpha = nil
        expect(subject).to_not be_valid
      end
      it 'must be numeric' do
        subject.mc_alpha = "ABC"
        expect(subject).to_not be_valid
      end
    end

    describe 'Mobile Commons Beta Bucket' do
      it 'is required' do
        subject.mc_beta = nil
        expect(subject).to_not be_valid
      end
      it 'must be numeric' do
        subject.mc_beta = "ABC"
        expect(subject).to_not be_valid
      end
    end

    describe 'Redirect URL' do
      it 'cannot be invalid' do
        subject.redirect = 'aosidjfoaijsdf'
        expect(subject).to_not be_valid
      end
      it 'must match a proper URL' do
        subject.redirect = 'http://www.google.com'
        expect(subject).to be_valid
      end
    end

    it 'is invalid without a redirect message' do
      subject.redirect_message = nil
      expect(subject).to_not be_valid
    end

    describe 'Color scheme' do
      it 'is required' do
        subject.color_scheme = nil
        expect(subject).to_not be_valid
      end
      it 'cannot be invalid' do
        subject.color_scheme = 'gold'
        expect(subject).to_not be_valid
      end
    end
  end

  it 'parameterizes itself' do
    sas = FactoryGirl.build(:share_a_stat)
    expect(sas.to_param).to eq [sas.id, sas.title].join('-').parameterize
  end
end
