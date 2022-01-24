require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'kadai.html')
server.mount('/kadai6', WEBrick::HTTPServlet::ERBHandler, 'kadai6.html.erb')
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/goya1.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya1.rb')
server.mount('/goya2.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya2.rb')
server.start