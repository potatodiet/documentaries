class Ability
  include CanCan::Ability

  def initialize(user)
    can(:read, :all)

    unless user
      can(:create, [User, :session])
    else
      if user.role?("regular")
        can(:create, [Documentary, Review])

        can([:destroy, :update], Documentary, uploader: user)
        can([:destroy, :update], Review, reviewer: user)
        can(:update, User, id: user.id)
        can(:destroy, :session)
      end

      if user.role?("admin")
        can(:manage, :all)
        can(:assign_roles)
      end
    end
  end
end
