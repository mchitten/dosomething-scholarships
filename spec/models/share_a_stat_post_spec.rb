require 'spec_helper'

describe ShareAStatPost do
  describe 'validations' do
    subject { FactoryGirl.build(:share_a_stat_post) }
    it { should be_valid }
    it { should respond_to(:my_name) }
    it { should respond_to(:my_number) }
    it { should respond_to(:friend_1) }
    it { should respond_to(:friend_2) }
    it { should respond_to(:friend_3) }
    it { should respond_to(:friend_4) }
    it { should respond_to(:friend_5) }
    it { should respond_to(:friend_6) }

    describe 'my name' do
      it 'is required' do
        subject.my_name = nil
        expect(subject).to_not be_valid
      end
      it 'must be a real name' do
        subject.my_name = '@#)($*@#$@#$'
        expect(subject).to_not be_valid
      end
    end

    describe 'my number' do
      it 'is required' do
        subject.my_number = nil
        expect(subject).to_not be_valid
      end
      it 'must be a real phone number' do
        subject.my_number = '@*(#&$)@(#$'
        expect(subject).to_not be_valid
      end
    end

    describe "my friends' numbers" do
      it 'are required' do
        subject.friend_1 = nil
        expect(subject).to_not be_valid
        subject.friend_2 = nil
        expect(subject).to_not be_valid
        subject.friend_3 = nil
        expect(subject).to_not be_valid
        subject.friend_4 = nil
        expect(subject).to_not be_valid
        subject.friend_5 = nil
        expect(subject).to_not be_valid
        subject.friend_6 = nil
        expect(subject).to_not be_valid
      end
      it 'must be real phone numbers' do
        subject.friend_1 = '@*(#&$)@(#$'
        expect(subject).to_not be_valid
        subject.friend_2 = '@*(#&$)@(#$'
        expect(subject).to_not be_valid
        subject.friend_3 = '@*(#&$)@(#$'
        expect(subject).to_not be_valid
        subject.friend_4 = '@*(#&$)@(#$'
        expect(subject).to_not be_valid
        subject.friend_5 = '@*(#&$)@(#$'
        expect(subject).to_not be_valid
        subject.friend_6 = '@*(#&$)@(#$'
        expect(subject).to_not be_valid
      end
    end
  end
end
