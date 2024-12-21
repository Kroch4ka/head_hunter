# frozen_string_literal: true

module HeadHunter
  class RequestMiddleware < Faraday::Middleware
    def on_request(env)
      config = options[:config]
      env[:request_headers].merge!({
                                     "HH-User-Agent" => "#{config.app_name}/#{config.app_version} (#{config.email})",
                                     "Authorization" => "Bearer #{fetch_token(config)}"
                                   })
    end

    private

    def fetch_token(config)
      token = config.storage.get
      return token if token

      APIRequests::Auth::GetToken.new(
        client_id: config.client_id,
        client_secret: config.client_secret,
        client_credentials: config.client_credentials
      )
    end
  end
end
