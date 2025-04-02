require 'roda'
require 'json'
require './app'
require 'mongoid'
require 'yaml'
require 'dotenv/load'

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

run App
