# frozen_string_literal: true

class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable

  after_commit :assign_default_role, on: :create

  delegate :can?, :cannot?, to: :ability

  has_many :activity_logs
  has_many :books, through: :activity_logs

  def ability = @ability ||= Ability.new(self)

  private

  def assign_default_role = add_role(:member)
end
