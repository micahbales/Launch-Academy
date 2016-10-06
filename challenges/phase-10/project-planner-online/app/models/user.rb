class User < ActiveRecord::Base

  def name
    name = "#{first_name}  #{last_name}"
    name
  end

  has_many :projects, through: :user_projects
  has_many :user_projects
  has_many :tasks
end
