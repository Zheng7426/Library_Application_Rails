class ApiController < ActionController::Base
# devise defines this, while knock is using `method_missing`
  # undef_method :current_user
end
