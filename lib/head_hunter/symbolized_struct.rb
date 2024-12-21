# frozen_string_literal: true

module HeadHunter
  class SymbolizedStruct < Dry::Struct
    transform_keys(&:to_sym)
  end
end
