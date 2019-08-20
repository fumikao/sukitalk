module UserHelper
  def birthday_to_age(birthday)
    user_age = (Date.today.strftime("%Y%m%d").to_i - birthday.strftime("%Y%m%d").to_i) / 10000
    if user_age >= 60
      "60代以上"
    elsif user_age >= 50
      "50代"
    elsif user_age >= 40
      "40代"
    elsif user_age >= 30
      "30代"
    elsif user_age >= 20
      "20代"
    else
      "未成年"
    end
  end
end
