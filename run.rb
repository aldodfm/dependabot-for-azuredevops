#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'azure_processor'

# Capture environment variables.
filter = ENV['filter']
organisation = ENV['organisation']
credentials = [
  {
    "type" => "git_source",
    "host" => "dev.azure.com",
    "username" => "x-access-token",
    "password" => ENV['credentials']
  },{
    "type" => "git_source",
    "host" => "github.com",
    "username" => "x-access-token",
    "password" => ENV["GITHUB_ACCESS_TOKEN"] # A GitHub access token with read access to public repos
  }
]

# Process projects in the organisation.
AzureProcessor.new(organisation, credentials, filter).process
