require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー登録機能" do
    it "必要な情報を適切に入力して「会員登録」ボタンを押すと、ユーザーの新規登録ができること" do
    end

    context "nicknameが必須であること" do
      it "nicknameが空欄の状態では登録できない" do
      end
    end

    context "メールアドレスが必須であること" do
      it "メールアドレスが空欄の状態では登録できない" do
      end

      it "メールアドレスがすでに存在している状態では登録できない" do
      end

      it "メールアドレスに「@」が含まれない状態では登録できない" do
      end
    end

    context "パスワードが必須であること" do
      it "パスワードが空欄では登録できない" do
      end

      it "パスワードが6文字未満では登録できない" do
      end

      it "パスワードとパスワード（確認）が一致しないと登録できない" do
      end

      it "パスワードが英字だけでは登録できない" do
      end

      it "パスワードが数字だけでは登録できない" do
      end
    end

    context "誕生日が必須であること" do
      it "誕生日が空欄では登録できない" do
      end
    end

    context "苗字が必須であること" do
      it "苗字が空欄では登録できない" do
      end

      it "苗字が全角文字でない状態では登録できない" do
      end
    end

    context "名前が必須であること" do
      it "名前が空欄では登録できない" do
      end

      it "名前が全角文字でない状態では登録できない" do
      end
    end

    context "苗字カナが必須であること" do
      it "苗字カナが空欄では登録できない" do
      end

      it "苗字が全角カナでない状態では登録できない" do
      end
    end

    context "名前カナが必須であること" do
      it "名前カナが空欄では登録できない" do
      end

      it "名前カナが全角カナでない状態では登録できない" do
      end
    end

  end
end
