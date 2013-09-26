module DsAuth
  class StaticPagesController < ApplicationController
    gated_pages :blank, require: [:administrator]
    def blank
      render text: 'hi', layout: false
    end
  end
end
