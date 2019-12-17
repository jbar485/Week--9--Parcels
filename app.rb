require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @parcels = Parcel.all
  erb(:parcels)
end

get('/parcels') do
  @parcels = Parcel.all
  erb(:parcels)
end

get('/parcels/new') do
  erb(:new_parcel)
end

get('/test') do
  @something = "this is a variable"
  erb(:whatever)
end

post('/parcels') do
  name = params[:parcel_name]
  height = params[:parcel_height]
  width = params[:parcel_width]
  weight = params[:parcel_weight]
  parcel = Parcel.new(name, height, width, weight, nil)
  parcel.save()
  @parcels = Parcel.all()
  erb(:parcels)
end

get('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:parcel)
end

get('/parcels/:id/edit') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:edit_parcel)
end

patch('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.update(params[:name])
  @parcels = Parcel.all
  erb(:parcels)
end

delete('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.delete()
  @parcels = Parcel.all
  erb(:parcels)
end
