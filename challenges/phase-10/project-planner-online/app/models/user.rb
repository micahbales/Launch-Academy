class User < ActiveRecord::Base

  has_many :projects, through: :user_projects
  has_many :user_projects
end
