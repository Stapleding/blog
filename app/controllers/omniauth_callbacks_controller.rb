class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  #def self.provides_callback_for(provider)
  def all

    @commenter = Commenter.find_for_oath(env["omniauth.auth"],
                                         current_commenter)
    if @commenter.persisted?
      
    else

      session["devise.#{provider}_data"] = env["omniath_auth"]
      redirect_to new_commenter_registration_path
    end

  end

  alias_method :twitter, :all

end