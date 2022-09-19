class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_groups, class_name: "Group", foreign_key: :user_id
  has_many :group_members
  has_many :joined_groups, through: :group_members, source: :group

  has_many :posts
end
