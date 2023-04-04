# frozen_string_literal: true

require 'json'
require 'sinatra'

get '/' do
  pp params: params
  puts '*' * 100
  erb template
end

post '/' do
  write(params['message'])
  erb template
end

def template
  @ip = `curl ifconfig.me`
  @container_id = `cat /etc/hostname`.gsub("\n", '')
  @content = File.read('disk/text.txt')
  File.read('index.html.erb')
end

def write(string)
  string += "\n" unless string.end_with? "\n"
  File.write('disk/text.txt', string, mode: 'a')
end