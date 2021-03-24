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

	init_db
	@db.execute 'CREATE TABLE IF NOT EXISTS Posts 
	(
	"ID" INTEGER PRIMARY KEY AUTOINCREMENT, 
	"CREATED_DATE" DATE,
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

	init_db

	@content = params[:content]
	
		if @content.length <= 0
			@error = 'Type text post'
			erb :new
		else
			@db.execute 'INSERT INTO Posts (CONTENT, CREATED_DATE) VALUES (?,datetime())', [@content]
			@message = 'Благодарочка за ваш коммент'
		end


	#erb "you typed #{@content}"
	end