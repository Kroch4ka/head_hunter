# frozen_string_literal: true

module HeadHunter
  class API
    include Dry::Configurable

    setting :email, default: "example@example.ru"
    setting :app_name, default: "default_app"
    setting :app_version, default: "1.0"
    setting :token_storage, default: NullStorage.new
    setting :client_id
    setting :client_secret
    setting :grant_type, default: "client_credentials"

    def call(request)
      response = connection.send(request.http_method, request.uri, request.params)
      OpenStruct.new(
        headers: response.headers,
        result: build_response_object(request, response.body),
        raw: response.body,
        status: response.status,
        ok: true
      )
    rescue StandardError => e
      OpenStruct.new(headers: response&.headers, status: response.status, ok: false, error: e.message)
    end

    def configure
      super
      @connection = Faraday.new("https://api.hh.ru/") do |f|
        f.request :json
        f.response :json
        f.response :raise_error
        f.response :logger
        f.use RequestMiddleware, config:
      end
      self
    end

    private

    attr_reader :connection

    def build_response_object(request, body)
      return body.map { request.build_response_object(_1) } if body.is_a?(Array)

      request.build_response_object(body)
    end
  end
end
