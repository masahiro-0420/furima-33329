require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname、email、encrypted_password、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end 
    it 'encrypted_passwordが空では登録できない' do
      @user.encrypted_password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Encrypted_password can't be blank")
    end   
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name can't be blank")
    end   
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    end   
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name_kana can't be blank")
    end   
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
    end  
    it 'birthdayが空では登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end  
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに＠が含まれていないと登録できない' do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email ")

    end   
    it 'encrypted_passwordが５文字以下では登録できない' do
      @user.encrypted_password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Encrypted_password is too short (minimum is 6 characters)')
    end
    it 'encrypted_passwordが半角英数字混合でないと登録できない' do
      @user.encrypted_password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Encrypted_password is ')
    end
    it 'encrypted_passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Encrypted_password")
    end
    it 'encrypted_passwordとpassword_confirmationが一致しないと登録できない' do
      @user.encrypted_password = '000aaa'
      @user.password_confirmation = 'aaa000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Encrypted_password")
    end  
  end
end
