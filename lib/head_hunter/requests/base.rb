# frozen_string_literal: true

module HeadHunter
  module Requests
    class Base < SymbolizedStruct
      def uri = raise NotImplementedError
      def http_method = raise NotImplementedError
      def params = {}
      def build_response_object(_object) = raise NotImplementedError
    end
  end
end
