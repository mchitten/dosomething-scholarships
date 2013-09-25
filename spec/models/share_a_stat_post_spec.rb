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
        (1..6).each do |n|
          subject.send("friend_#{n}=", nil)
          expect(subject).to_not be_valid
        end
      end
      it 'must be real phone numbers' do
        (1..6).each do |n|
          subject.send("friend_#{n}=", '@*(#&$)@(#$')
          expect(subject).to_not be_valid
        end
      end
    end
  end
end
