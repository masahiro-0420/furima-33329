require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname、email、encrypted_password、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
    end
    it 'nicknameが空では登録できない' do
    end
    it 'emailが空では登録できない' do
    end 
    it 'encrypted_passwordが空では登録できない' do
    end   
    it 'last_nameが空では登録できない' do
    end   
    it 'first_nameが空では登録できない' do
    end   
    it 'last_name_kanaが空では登録できない' do
    end   
    it 'first_name_kanaが空では登録できない' do
    end  
    it 'birthdayが空では登録できない' do
    end  
    it '重複したemailが存在する場合登録できない' do
    end
    it 'emailに＠が含まれていないと登録できない' do
    end   
    it 'encrypted_passwordが５文字以下では登録できない' do
    end
    it 'encrypted_passwordが半角英数字混合でないと登録できない' do
    end
    it 'encrypted_passwordが存在してもpassword_confirmationが空では登録できない' do
    end
    it 'encrypted_passwordとpassword_confirmationが一致しないと登録できない' do
    end  
  end
end
