class Ability
  include CanCan::Ability

  def initialize(user)
    can :list, Call
    can :public_show, Call
    can :list, Document
    can :manage, Subscriber

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

      else
        can :read, Theme
        can :read, ResearchType
        can :read, ResearchCenter
        can :read, Call
        can :read, Document
        can :manage, User, user: user
        cannot :users_list, User
        can :manage, Proposal, user: user
        cannot :manage, Subscriber
      end
    end
  end
end
