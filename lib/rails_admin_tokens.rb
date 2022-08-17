require "rails_admin_tokens/version"
require "rails_admin_tokens/engine"

#module RailsAdminTokens
# Your code goes here...
#end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class Tokens < Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :refresh_method do
          :refresh_token_if_expired
        end
        register_instance_option :member do
          true
        end

        register_instance_option :route_fragment do
          'tokens'
        end

        register_instance_option :http_methods do
          %i[get put]
        end

        register_instance_option :controller do
          proc do
            if request.get? # Tokens

              respond_to do |format|
                format.html { render @action.template_name }
                format.js { render @action.template_name, layout: 'rails_admin/modal', content_type: Mime[:html].to_s }
              end

            elsif request.put? # Refresh Tokens
              @authorization_adapter&.authorize(:update, @abstract_model, @object)
              if @object.send(@action.refresh_method)
                changes = @object.changes
                @object.save
                @auditing_adapter&.update_object(@object, @abstract_model, _current_user, changes)
                respond_to do |format|
                  format.html { render @action.template_name }
                  format.json { render json: { id: @object.id.to_s, label: @model_config.with(object: @object).object_label } }
                end
              else
                flash.now[:notice] = I18n.t('admin.flash.noaction')
              end
            end
          end
        end

        register_instance_option :link_icon do
          'fas fa-sync'
        end

        register_instance_option :writable? do
          !(bindings[:object] && bindings[:object].readonly?)
        end
      end
    end
  end
end
