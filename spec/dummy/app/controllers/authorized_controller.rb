class AuthorizedController < InheritedResources::Base
  # Responders
  respond_to :html, :js, :json
end
