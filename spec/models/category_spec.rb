require 'rails_helper'
describe Category do
  describe '#create' do

    it "is valid with a name" do
      category = build(:category)
      expect(category).to be_valid
    end

    it "is invalid without a name" do
      category = build(:category, name: "")
      category.valid?
      expect(category.errors[:name]).to include("を入力してください")
    end

    it "is invalid with a name that has more than 21 characters " do
      category = build(:category, name: "この文章はダミーです。文字の大きさ、量、字")
      category.valid?
      expect(category.errors[:name][0]).to include("は20文字以内で入力してください")
    end

    it "is valid with a name that has less than 20 characters " do
      category = build(:category, name: "この文章はダミーです。文字の大きさ、量、")
      expect(category).to be_valid
    end

  end
end