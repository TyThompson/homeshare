json.user do
  json.housemate @user
  json.total_exp @user_exp
  json.user_level @user_level
  json.user_percent @user_percent
  json.homes @homes
  json.homes_exp @home_exp
  json.homes_level @home_level
  json.homes_percent @home_percent
end
