require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it '入力必須項目全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合で6文字以上であれば登録できる' do
        @user.password = '1234pw'
        @user.password_confirmation = '1234pw'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は全角漢字であれば登録できる' do
        @user.first_name = '信条'
        @user.last_name  = '剛'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は全角ひらがなであれば登録できる' do
        @user.first_name = 'しんじょう'
        @user.last_name  = 'つよし'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は全角カタカナであれば登録できる' do
        @user.first_name = 'シンジョウ'
        @user.last_name  = 'ツヨシ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'eamilに@が入っていなければ登録できない' do
        @user.email = 'abcdefg.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '1234p'
        @user.password_confirmation = '1234p'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが英文字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが半角だと登録できない" do
        @user.first_name = 'ｼﾝｼﾞｮｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが半角だと登録できない" do
        @user.last_name = 'ﾂﾖｼ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'kana_firstが空だと登録できない' do
        @user.kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank")
      end
      it 'kana_firstが半角だと登録できない' do
        @user.kana_first = 'ｼﾝｼﾞｮｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first is invalid")
      end
      it 'kana_lastが空だと登録できない' do
        @user.kana_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last can't be blank")
      end
      it 'kana_lastが半角だと登録できない' do
        @user.kana_last = 'ﾂﾖｼ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last is invalid")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
