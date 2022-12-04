# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :list, Call
    can :public_show, Call
    can :list, Document

    if user.present?
      if user.admin?
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
        can :read, Proposal

      else
        can :read, Theme
        can :read, ResearchType
        can :read, ResearchCenter
        can :read, Call
        can :manage, User, user: user
        can :manage, Proposal, user: user
      end
    end

  end
end
