require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー登録機能" do

    context "新規登録できるとき" do
      it "必要な情報を適切に入力して「会員登録」ボタンを押すと、ユーザーの新規登録ができること" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "nicknameが空欄の状態では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "メールアドレスが空欄の状態では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "メールアドレスがすでに存在している状態では登録できない" do
        user1 = FactoryBot.build(:user)
        user1.save
        @user.email = user1.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end

      it "メールアドレスに「@」が含まれない状態では登録できない" do
        @user.email = "nekowanko.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "パスワードが空欄では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワードが6文字未満では登録できない" do
        @user.password = "111aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードが全角文字を含むと登録できない" do
        @user.password = "111aaaＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには英字と数字の両方を含めて設定してください")
      end

      it "パスワードとパスワード（確認）が一致しないと登録できない" do
        @user.password_confirmation = "111aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "パスワードが英字だけでは登録できない" do
        @user.password = "aabbcc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには英字と数字の両方を含めて設定してください")
      end

      it "パスワードが数字だけでは登録できない" do
        @user.password = "111223"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには英字と数字の両方を含めて設定してください")
      end

      it "誕生日が空欄では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "苗字が空欄では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "苗字が全角文字でない状態では登録できない" do
        @user.last_name = "mike"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end

      it "名前が空欄では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "名前が全角文字でない状態では登録できない" do
        @user.first_name = "neko"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end

      it "苗字カナが空欄では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "苗字が全角カナでない状態では登録できない" do
        @user.last_name_kana = "mike"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
      end

      it "名前カナが空欄では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "名前カナが全角カナでない状態では登録できない" do
        @user.first_name_kana = "neko"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
      end
    end

  end
end
