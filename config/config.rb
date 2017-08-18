# Add in commit user/email
class Precious::App
    before do

        #settings.wiki_options[:allow_editing] = false

        if env['HTTP_X_PROXY_REMOTE_USER'] != '(null)'
            #settings.wiki_options[:allow_editing] = true

            session['gollum.author'] = {
                :name       => "%s" % [env['HTTP_X_PROXY_REMOTE_USER']],
                :email      => "%s" % env['HTTP_X_PROXY_REMOTE_EMAIL'],
            }
        else
            session['gollum.author'] = {
                :name       => "test",
            }
        end
    end
end

# Specify the wiki options.
wiki_options = {
#  :allow_editing => true,
  :h1_title => true,
  :live_preview => true,
  :allow_uploads => 'dir',
}
Precious::App.set(:wiki_options, wiki_options)

# Specify the path to the Wiki.
#gollum_path = '/vagrant/wiki'
#Precious::App.set(:gollum_path, gollum_path)
