require 'rails_helper'
describe Genre do
  describe '#create' do

    it "is valid with a name" do
      genre = build(:genre)
      expect(genre).to be_valid
    end

    it "is invalid without a name" do
      genre = build(:genre, name: "")
      genre.valid?
      expect(genre.errors[:name]).to include("を入力してください")
    end

    it "is invalid with a name that has more than 21 characters " do
      genre = build(:genre, name: "この文章はダミーです。文字の大きさ、量、字")
      genre.valid?
      expect(genre.errors[:name][0]).to include("は20文字以内で入力してください")
    end

    it "is valid with a name that has less than 20 characters " do
      genre = build(:genre, name: "この文章はダミーです。文字の大きさ、量、")
      expect(genre).to be_valid
    end

  end
end