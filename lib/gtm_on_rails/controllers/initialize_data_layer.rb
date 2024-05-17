module GtmOnRails
  module Controllers
    module InitializeDataLayer
      extend ActiveSupport::Concern

      included do
        if Rails::VERSION::MAJOR == 3
          before_filter :initialize_data_layer
        else
          before_action :initialize_data_layer
        end
        helper_method :data_layer
      end

      def data_layer
        @gtm_on_rails_data_layer
      end

      private
        def initialize_data_layer
          @gtm_on_rails_data_layer = GtmOnRails::DataLayer.new

          if GtmOnRails.config.send_controller_and_action_in_data_layer
            @gtm_on_rails_data_layer.push({
              rails_controller: controller_path,
              rails_action:     action_name
            }, before_page_view: true)
          end
        end
    end
  end
end
