require 'rails_helper'
describe Talk do
  describe '#create' do

    it "is valid with a content" do
      talk = build(:talk)
      expect(talk).to be_valid
    end

    it "is invalid without a content" do
      talk = build(:talk, content: "")
      talk.valid?
      expect(talk.errors[:content]).to include("を入力してください")
    end

    it "is invalid with a name that has more than 201 characters " do
      talk = build(:talk, content: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れて")
      talk.valid?
      expect(talk.errors[:content][0]).to include("は200文字以内で入力してください")
    end

    it "is valid with a name that has less than 200 characters " do
      talk = build(:talk, content: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れ")
      expect(talk).to be_valid
    end

  end
end