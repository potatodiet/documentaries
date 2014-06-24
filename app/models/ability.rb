class Ability
  include CanCan::Ability

  def initialize(user)
    can(:read, :all)

    unless user
      can(:create, [User, :session])
    else
      can(:create, [Documentary, Review])

      can([:destroy, :update], Documentary, :uploader => user)
      can([:destroy, :update], Review, :reviewer => user)
      can(:update, User, :id => user.id)
      can(:destroy, :session)
    end
  end
end
