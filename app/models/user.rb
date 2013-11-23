class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, :name

  has_many :list_subscriptions
  has_many :lists, through: :list_subscriptions

  has_many :list_todos, class_name: "Todo", foreign_key: :list_id
  
  has_many :assigned_todos, class_name: "Todo", foreign_key: :assigned_user_id
  has_many :created_todos, class_name: "Todo", foreign_key: :creator_user_id
  
  has_many :assigned_tasks, class_name: "Task", foreign_key: :assigned_user_id
  has_many :created_tasks, class_name: "Task", foreign_key: :creator_user_id

end
