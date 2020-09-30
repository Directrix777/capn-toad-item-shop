class ApplicationController < ActionController::Base
    include ActionView::Helpers::TextHelper
    helper_method :current_user
    helper_method :pluralize
    before_action :set_admin

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    def admin_only
        if !@admin
            redirect_to '/'
        end
    end

    def set_admin
        @admin = current_user.admin unless current_user == nil
    end
end
