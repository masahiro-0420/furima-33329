FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    encrypted_password    {'000aaa'}
    password_confirmation {encrypted_password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              { Date.new(1978, 4, 20) }
  end
end