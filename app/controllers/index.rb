get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :create_event
end

post '/events/create' do
  event = Event.new(title: params[:title], organizer_name: params[:organizer_name], organizer_email: params[:organizer_email], date: params[:date])

  if event.save
    redirect '/'
  else
    @errors = event.errors.full_messages
    erb :create_event
  end
end
