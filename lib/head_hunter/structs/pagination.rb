# frozen_string_literal: true

module HeadHunter
  module Structs
    class Pagination < SymbolizedStruct
      attribute :page?, Types::Params::Integer.optional
      attribute :per_page?, Types::Params::Integer.optional
    end
  end
end
