#!/usr/bin/env ruby
require 'rubygems'
require 'gollum/app'

gollum_path = '/wiki' # CHANGE THIS TO POINT TO YOUR OWN WIKI REPO
wiki_options = {
  :css => true,
  :js => true,
  :template_dir => '/wiki/config/templates',
  :h1_title => true,
  :live_preview => false,
  #:allow_editing => false,
  #:allow_uploads => 'dir',
}

Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:default_markup, :markdown) # set your favorite markup language
Precious::App.set(:wiki_options, wiki_options)

GitHub::Markup::Markdown::MARKDOWN_GEMS['kramdown'] = proc { |content|
  Kramdown::Document.new(content, :auto_ids => false).to_html
}

# Add in commit user/email
class Precious::App
    before do

        if (request.env.key?('HTTP_X_PROXY_REMOTE_USER') && request.env['HTTP_X_PROXY_REMOTE_USER'] != '(null)')
            session['gollum.author'] = {
                :name       => "%s" % request.env['HTTP_X_PROXY_REMOTE_USER'],
                :email      => "%s" % request.env['HTTP_X_PROXY_REMOTE_EMAIL'],
            }
	else
            session['gollum.author'] = {
                :name       => "uzerp",
                :email      => "hello@uzerp.com"
            }
	end
    end
end

module Gollum
  class Macro
    class NeedsReview < Gollum::Macro
      def render
        '<span class="attention review">This page is in need of review. Some of the information presented may be out of date or inaccurate.</span>'
      end
    end
  end
end

run Precious::App

