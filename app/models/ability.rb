# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Call
    can :manage, Subscriber
    can :manage, User

    return unless user.present?

    admin_permissions(user)
    coordinator_permissions(user)
    researcher_permissions(user)
  end

  def admin_permissions(user)
    return unless user.admin?

    can :manage, :all
  end

  def coordinator_permissions(user)
    return unless user.coordinator?

    can :manage, User
    can(:manage, Proposal, user:)
    cannot :create, Proposal
  end

  def researcher_permissions(user)
    return unless user.researcher?

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
