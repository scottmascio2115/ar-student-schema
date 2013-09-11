require_relative '../../db/config'

class Student < ActiveRecord::Base

  validates :age, :numericality => { :greater_than => 5}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, :uniqueness => true
  validates :phone, length: { minimum: 10 }

  def name
    first_name + " " + last_name
  end

  def age
     now = Date.today
     age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)

  end


end
 
