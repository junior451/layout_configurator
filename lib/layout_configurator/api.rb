require 'sinatra/base'
    
module LayoutConfigurator
  class Api < Sinatra::Base

    get '/pages/:id' do
      LayoutRepository.search(params[:id]).nil? ? 404 : LayoutRepository.search(params[:id])
    end

    put '/pages/:id' do
      LayoutRepository.remove(params[:id])
      LayoutRepository.store(params[:id], 'I am foo')
      LayoutRepository.search(params[:id])
    end
  end
end
