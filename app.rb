#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/contrib/all'
require 'sqlite3'



			def init_db

				@db = SQLite3::Database.new 'leprosorium.db'
				@db.results_as_hash = true

			end



before do
	init_db
end

configure do
	
	@db.execute 'CREATE TABLE IF NOT EXISTS Posts 
	(
	"ID" INTEGER PRIMARY KEY AUTOINCREMENT, 
	"CREATED DATE" DATE,
	"CONTENT" TEXT
	)'

end



get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/new' do
	erb :new 
end

post '/new' do
	@content = params[:content]

	erb "you typed #{@content}"
	end