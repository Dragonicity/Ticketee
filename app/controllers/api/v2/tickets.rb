require "sinatra"

module API
  module V2
    class Tickets < Sinatra::Base
      before do 
        headers "Content-Type" => "text/json"
        set_user
        set_project
      end

      get "/:id" do
        ticket = @project.tickets.find(params[:id])
        unless TicketPolicy.new(@user, ticket).show?
          halt 404, "The ticket you were looking for could not be found"
        end
        TicketSerializer.new(ticket).to_json
      end

      private

      def set_user
        if env["HTTP_AUTHORIZATION"].present?
          auth_token = /Token token=(.*)/.match(env["HTTP_AAUTHORIZATION"])[1]
          User.find_by!(api_key: auth_token)
        end
      end

      def set_project
        @project = Project.find(params[:project_id])
      end

      def params
        hash = env["action_dispatch.request.path_parameters"].merge!(super)
        HashWithIndifferentAccess.new(hash)
      end
    end
  end
end