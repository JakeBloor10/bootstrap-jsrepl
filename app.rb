require 'sinatra'
require 'liquid'


class App < Sinatra::Base

  # Use this data structure to pass values into the liquid template
  # The hash keys should match values in atlas.json
  @@atlas_data = {
    'layout'    => "theme/html/layout.html",
    'title'     => "Bootstrap theme test",
    'doctype'   => "<html lang='en' xmlns='http://www.w3.org/1999/xhtml'>",
    'content'   => IO.read("sample-content.html"),
    'toc'       => IO.read("sample-toc.html"),
    'prev_link' => "Previous",
    'next_link' => "Next"
  }
  
  # route to the index file
  get "/" do
    template = Liquid::Template.parse(IO.read(@@atlas_data['layout']))
    template.render(@@atlas_data)
  end
  
  
  
end