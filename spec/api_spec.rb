require 'spec_helper'
require 'rack/test'

module LayoutConfigurator
  describe Api do
    include Rack::Test::Methods

    let(:app) { Api.new }

    describe 'GET /pages/:id' do
      context 'when a valid id is given' do
        before do
          LayoutRepository.store('foo', 'I am foo')
        end

        it 'returns the relevant config' do
          get '/pages/foo'

          expect(last_response.body).to eq('I am foo')
        end

        it 'response with a 200 (OK)' do
          get '/pages/foo'

          expect(last_response.status).to eq(200)
        end
      end

      context 'when an invalid id is given' do
        before do
          LayoutRepository.store('foo', 'I am foo')
        end

        it 'returns an empty string' do
          get '/pages/bar'

          expect(last_response.body).to eq('')
        end

        it 'response with a 404 (Not Found)' do
          get '/pages/bar'

          expect(last_response.status).to eq(404)
        end
      end
    end

    describe 'PUT /pages/foo' do
      context 'when the id doesnt already exist' do
        it 'returns the relevant config' do
          put '/pages/foo'

          expect(last_response.body).to eq('I am foo')
        end

        it 'response with a 200 (OK)' do
          put '/pages/foo'
          expect(last_response.status).to eq(200)
        end
      end

      context 'when the id already exist' do
        before do
          LayoutRepository.store('foo', 'You are foo')
        end

        it 'returns the updated config' do
          put '/pages/foo'

          expect(last_response.body).to eq('I am foo')
        end
        it 'response with a 200 (OK)' do
          put '/pages/foo'

          expect(last_response.status).to eq(200)
        end
      end
    end
  end
end