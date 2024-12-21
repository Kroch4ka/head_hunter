# frozen_string_literal: true

require_relative "head_hunter/version"

require "zeitwerk"
require "dry-configurable"
require "faraday"
require "ostruct"
require "dry-struct"

loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/insulin.rb")
loader.inflector.inflect("api" => "API")
loader.setup

module HeadHunter
  class Error < StandardError; end
  # Your code goes here...
end
