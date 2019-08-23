require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with a content" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid with a nickname that has more than 21 characters " do
      user = build(:user, nickname: "この文章はダミーです。文字の大きさ、量、字")
      user.valid?
      expect(user.errors[:nickname][0]).to include("は20文字以内で入力してください")
    end

    it "is valid with a nickname that has less than 20 characters " do
      user = build(:user, nickname: "この文章はダミーです。文字の大きさ、量、")
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid with a password that has more than 129 characters " do
      user = build(:user, password: "012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678")
      user.valid?
      expect(user.errors[:password][0]).to include("は128文字以内で入力してください")
    end

    it "is valid with a password that has less than 128 characters " do
      user = build(:user, password: "01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567")
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "01234")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end

    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "012345")
      expect(user).to be_valid
    end

  end
end