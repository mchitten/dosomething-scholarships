module DsAuth
  class TestController < ApplicationController
    def test
      render text: 'hi', layout: false
    end
  end
end
