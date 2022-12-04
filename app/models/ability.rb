# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Call, published: true

    return unless user.present?
    can :read, Theme
    can :read, ResearchType
    can :read, ResearchCenter
    can :read, Department
    can :read, Call
    can :read, User

    return unless user.admin?
    can :manage, User
    can :manage, Theme
    can :manage, ResearchType
    can :manage, ResearchCenter
    can :manage, Faculty
    can :manage, EducationLevel
    can :manage, Document
    can :manage, Department
    can :manage, Call
    can :manage, AcademicRank
  end
end
