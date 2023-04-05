# frozen_string_literal: true

require 'json'
require 'sinatra'

get '/' do
  erb template
end

post '/' do
  write(params['message'])
  erb template
end

def ip = @ip ||= `curl ifconfig.me`
def container_id = @container_id ||= `cat /etc/hostname`.gsub("\n", '')
def template = File.read('index.html.erb')

def write(string)
  string += "\n" unless string.end_with? "\n"
  File.write('disk/text.txt', string, mode: 'a')
end

def content
  File.read('disk/text.txt')
rescue
  nil
end
