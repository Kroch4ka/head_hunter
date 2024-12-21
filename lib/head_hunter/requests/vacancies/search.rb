# frozen_string_literal: true

module HeadHunter
  module Requests
    module Vacancies
      class Search < Base
        attribute :text, Types::Params::String
        attribute :search_field?, Types::Params::String.optional
        attribute :experience?, Types::Params::String.optional
        attribute :employment?, Types::Params::String.optional
        attribute :schedule?, Types::Params::String.optional
        attribute :area?, Types::Params::String.optional
        attribute :metro?, Types::Params::String.optional
        attribute :professional_role?, Types::Params::String.optional
        attribute :industry?, Types::Params::String.optional
        attribute :employer_id?, Types::Params::String.optional
        attribute :salary?, Types::Params::String.optional
        attribute :currency?, Types::Params::String.optional
        attribute :salary?, Types::Params::Integer.optional
        attribute :label?, Types::Params::String.optional
        attribute :only_with_salary?, Types::Params::Bool.optional
        attribute :period?, Types::Params::Integer.optional
        attribute :date_from?, Types::Params::Date.optional
        attribute :date_to?, Types::Params::Date.optional
        attribute :order_by?, Types::Params::Date.optional
        attribute :clusters?, Types::Params::Bool.optional
        attribute :describe_arguments?, Types::Params::Bool.optional
        attribute :no_magic?, Types::Params::Bool.optional
        attribute :premium?, Types::Params::Bool.optional
        attribute :accept_temporary?, Types::Params::Bool.optional
        attribute :locale?, Types::Params::String.optional
        attribute :host?, Types::Params::String.optional
        attribute :responses_count_enabled?, Types::Params::Bool.optional
        attribute :part_time?, Types::Params::String.optional
        attributes_from Structs::Pagination
      end
    end
  end
end
