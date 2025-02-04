class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def content_not_found
    render file: "#{Rails.root}/public/404.html", layout: true, status: :not_found
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_path, alert: "You don't have permissions to complete this action." }
    end
  end
end
