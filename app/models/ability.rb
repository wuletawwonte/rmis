# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :list, Call
    can :public_show, Call
    can :list, Document
    can :manage, Subscriber

    return unless user.present?

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
      can :manage, GlobalSetting

    elsif user.coordinator?
      can :manage, User
      can(:manage, Proposal, user:)
      cannot :create, Proposal

    else
      can :read, Theme
      can :read, ResearchType
      can :read, ResearchCenter
      can :read, Call
      can :read, Document
      can :manage, User
      can :manage, Member
      cannot :users_list, User
      can(:manage, Proposal, user:)
      can :read, Proposal
      can :create, Proposal
      cannot :manage, Subscriber
    end
  end
end
