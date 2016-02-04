require 'spec_helper'

describe Rack::Downcase do
  def app
    @app ||= Rack::Builder.new do
      use Rack::Downcase
      run lambda { |env| [200, { 'Content-Type' => 'text/plain' }, ['Hello World'] ] }
    end
  end

  context 'GET requests' do
    context 'without a path' do
      it 'should not redirect' do
        get '/', {}, 'HTTP_HOST' => 'example.org'
        expect(last_response.status).to eq(200)
      end
    end

    context 'with a path that does not include a capital letter' do
      it 'should not redirect' do
        get '/blog', {}, 'HTTP_HOST' => 'example.org'
        expect(last_response.status).to eq(200)
      end
    end

    context 'with a path that includes a capital letter' do
      it 'should redirect to a url without a capital letter' do
        get '/Blog', {}, 'HTTP_HOST' => 'example.org'
        expect(last_response.status).to eq(301)
        expect(last_response['Location']).to eq('http://example.org/blog')
      end

      it 'should redirect and provide a Content-Type' do
        get '/Blog', {}, 'HTTP_HOST' => 'example.org'
        expect(last_response.status).to eq(301)
        expect(last_response['Content-Type']).to eq('text/html')
      end
    end

    context 'with a query string' do
      it 'to retain and not change the query string when redirecting' do
        get '/Blog?Article=1', {}, 'HTTP_HOST' => 'example.org'
        expect(last_response.status).to eq(301)
        expect(last_response['Location']).to eq('http://example.org/blog?Article=1')
      end
    end

    context 'with a port' do
      it 'to retain the port when redirecting' do
        get '/Blog', {}, 'HTTP_HOST' => 'example.org', 'SERVER_PORT' => '3000'
        expect(last_response.status).to eq(301)
        expect(last_response['Location']).to eq('http://example.org:3000/blog')
      end
    end

    context 'with a subdomain' do
      it 'to retain the subdomain when redirecting' do
        get '/Blog', {}, 'HTTP_HOST' => 'www.example.org'
        expect(last_response.status).to eq(301)
        expect(last_response['Location']).to eq('http://www.example.org/blog')
      end
    end
  end

  context 'POST requests' do
    it 'to not redirect' do
      post '/Blog', {}, 'HTTP_HOST' => 'example.org'
      expect(last_response.status).to eq(200)
    end
  end
end
