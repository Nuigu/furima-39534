require 'rails_helper'

RSpec.describe User, type: :model do

  describe "ユーザー登録機能" do
    before do
      @user = FactoryBot.build(:user)
    end

    context "新規登録できるとき" do
      it "必要な情報を適切に入力して「会員登録」ボタンを押すと、ユーザーの新規登録ができること" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "ニックネームが空欄の状態では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it "メールアドレスが空欄の状態では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "メールアドレスがすでに存在している状態では登録できない" do
        user1 = FactoryBot.build(:user)
        user1.save
        @user.email = user1.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it "メールアドレスに「@」が含まれない状態では登録できない" do
        @user.email = "nekowanko.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it "パスワードが空欄では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "パスワードが6文字未満では登録できない" do
        @user.password = "111aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it "パスワードが全角文字を含むと登録できない" do
        @user.password = "111aaaＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めて設定してください")
      end

      it "パスワードとパスワード（確認）が一致しないと登録できない" do
        @user.password_confirmation = "111aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "パスワードが英字だけでは登録できない" do
        @user.password = "aabbcc"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めて設定してください")
      end

      it "パスワードが数字だけでは登録できない" do
        @user.password = "111223"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めて設定してください")
      end

      it "誕生日が空欄では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end

      it "苗字が空欄では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end

      it "姓が全角文字でない状態では登録できない" do
        @user.last_name = "mike"
        @user.valid?
        expect(@user.errors.full_messages).to include("姓には全角文字を使用してください")
      end

      it "名前が空欄では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前を入力してください")
      end

      it "名前が全角文字でない状態では登録できない" do
        @user.first_name = "neko"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前には全角文字を使用してください")
      end

      it "姓カナが空欄では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("姓カナを入力してください")
      end

      it "姓が全角カナでない状態では登録できない" do
        @user.last_name_kana = "mike"
        @user.valid?
        expect(@user.errors.full_messages).to include("姓カナには全角カナを使用してください")
      end

      it "名前カナが空欄では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナを入力してください")
      end

      it "名前カナが全角カナでない状態では登録できない" do
        @user.first_name_kana = "neko"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナには全角カナを使用してください")
      end
    end

  end
end
