# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login
  rescue_from StandardError, with: :render500
  rescue_from ActiveRecord::RecordNotFound, with: :render404

  def render500(error = nil)
    Rails.logger.error("❌#{error.message}") if error
    render template: 'errors/error500', layout: 'error', status: :internal_server_error
  end

  def render404(error = nil)
    Rails.logger.error("❌#{error.message}") if error
    render template: 'errors/error404', layout: 'error', status: :not_found
  end

  def raise500
    raise '意図的な500エラー'
  end

  private

  def not_authenticated
    redirect_to login_path
  end
end
