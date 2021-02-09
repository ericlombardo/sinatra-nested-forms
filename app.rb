require './environment'

module FormsLab
  class App < Sinatra::Base

    # set :views => "views/pirates"
    get '/' do 
      erb :root
    end
    
    get '/new' do # display form
      erb :'/pirates/new'
    end

    post '/pirates' do
      # create instance of pirate with params and assign to @pirate variable
      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])
      
      # loops through ships, creates new instance with user input
      params[:pirate][:ships].each do |s|
        Ship.new(s[:name], s[:type], s[:booty])
      end
      
      @ships = Ship.all   # assigns all ships in class to @ships variable

      erb :'pirates/show'   # sends to pirates/show.erb for rendering
    end
  end
end
