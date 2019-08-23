require 'rails_helper'
describe Comment do
  describe '#create' do

    it "is valid with a content" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "is invalid without a content" do
      comment = build(:comment, content: "")
      comment.valid?
      expect(comment.errors[:content]).to include("を入力してください")
    end

    it "is invalid with a name that has more than 201 characters " do
      comment = build(:comment, content: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れて")
      comment.valid?
      expect(comment.errors[:content][0]).to include("は200文字以内で入力してください")
    end

    it "is valid with a name that has less than 200 characters " do
      comment = build(:comment, content: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れ")
      expect(comment).to be_valid
    end

  end
end