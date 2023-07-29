require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "出品できるとき" do
      it "必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存される" do
        expect(@item).to be_valid
      end
    end

    context "出品できないとき" do
      it "商品名が空欄では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name 商品名を入力してください")
      end

      it "商品名が41文字以上では登録できない" do
        @item.name = Faker::String.random(length: 41..100)
        @item.valid?
        expect(@item.errors.full_messages).to include("Name 商品名は40文字以内にしてください")
      end

      it "商品の説明が空欄では登録できない" do
        @item.detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail 商品の説明を入力してください")
      end

      it "商品の説明が1001文字以上では登録できない" do
        @item.detail = Faker::String.random(length: 1001..1100)
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail 説明は1,000文字以内にしてください")
      end

      it "価格が空欄では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格を入力してください")
      end

      it "価格が299以下では登録できない" do
        @item.price = Faker::Number.between(from: 1, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 販売価格は300円から9,999,999円の間に設定してください")
      end

      it "価格が10000000以上では登録できない" do
        @item.price = Faker::Number.between(from: 10000000, to: 100000000)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 販売価格は300円から9,999,999円の間に設定してください")
      end

      it "価格が全角文字では登録できない" do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 販売価格は300円から9,999,999円の間に設定してください")
      end

      it "カテゴリーが'---'では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category カテゴリーを選択してください")
      end

      it "商品の状態が'---'では登録できない" do
        @item.quality_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality 商品の状態を選択してください")
      end

      it "配送料の負担が'---'では登録できない" do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost 配送料の負担を選択してください")
      end

      it "発送元の地域が'---'では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture 発送元の地域を選択してください")
      end

      it "発送までの日数が'---'では登録できない" do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time 発送までの日数を選択してください")
      end

      it "商品の画像なしでは登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image 商品の画像を選択してください")
      end

      it "Userが紐づいていなければ登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
