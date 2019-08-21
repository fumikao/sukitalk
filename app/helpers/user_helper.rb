module UserHelper
  def birthday_to_age(birthday)
    user_age = (Date.today.strftime("%Y%m%d").to_i - birthday.strftime("%Y%m%d").to_i) / 10000
    if user_age >= 60
      5
    elsif user_age >= 50
      4
    elsif user_age >= 40
      3
    elsif user_age >= 30
      2
    elsif user_age >= 20
      1
    else
      0
    end
  end

  def show_age(birthday)
    if birthday_to_age(birthday) == 5
      "60代以上"
    elsif birthday_to_age(birthday) == 4
      "50代"
    elsif birthday_to_age(birthday) == 3
      "40代"
    elsif birthday_to_age(birthday) == 2
      "20代"
    elsif birthday_to_age(birthday) == 1
      "20代"
    else
      "未成年"
    end
  end
end
