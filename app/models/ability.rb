class Ability
  include CanCan::Ability

  def initialize(user)
    can(:read, :all)

    unless user
      can(:create, [User, :session])
    else
      can(:create, [Documentary, Review])

      can([:destroy, :update], Documentary, :uploader_user => user.id)
      can([:destroy, :update], Review, :user_id => user.id)
      can(:update, User, :id => user.id)
      can(:destroy, :session)
    end
  end
end
