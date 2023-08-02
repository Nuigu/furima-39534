require 'rails_helper'

RSpec.describe OrderForm, type: :model do

  describe "商品購入機能" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
      sleep 0.2
    end

    context "購入できるとき" do
      it "必要な情報を適切に入力して「購入」ボタンを押すと、商品の購入ができる" do
        expect(@order_form).to be_valid
      end

      it "建物名は空でも商品の購入ができる" do
        @order_form.building = ""
        expect(@order_form).to be_valid
      end
    end

    context "商品の購入ができないとき" do
      it "郵便番号が空では購入できない" do
        @order_form.postal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code 入力してください")
      end

      it "郵便番号が8桁未満では購入できない" do
        @order_form.postal_code = "123-456"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code '000-0000'の形式で入力してください")
      end

      it "郵便番号にハイフンがないと購入できない" do
        @order_form.postal_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code '000-0000'の形式で入力してください")
      end

      it "郵便番号が全角では購入できない" do
        @order_form.postal_code = "１２３―４５６７"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code '000-0000'の形式で入力してください")
      end

      it "郵便番号が英字では購入できない" do
        @order_form.postal_code = "123-456a"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code '000-0000'の形式で入力してください")
      end

      it "user_idがnilでは購入できない" do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User 入力してください")
      end

      it "item_idがnilでは購入できない" do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item 入力してください")
      end

      it "都道府県が'---'では購入できない" do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture 都道府県を選択してください")
      end

      it "市区町村が空では購入できない" do
        @order_form.city = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City 入力してください")
      end

      it "住所が空では購入できない" do
        @order_form.address = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address 入力してください")
      end

      it "電話番号が空では購入できない" do
        @order_form.phone_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number 入力してください")
      end

      it "電話番号が10桁未満では購入できない" do
        @order_form.phone_number = "123456789"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number 桁数を確認してください")
      end

      it "電話番号が全角では購入できない" do
        @order_form.phone_number = "０００１１１１２２２２"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number 半角数字のみで入力してください")
      end

      it "電話番号が英字では購入できない" do
        @order_form.phone_number = "0001111aaaa"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number 半角数字のみで入力してください")
      end
    end
  end
end
