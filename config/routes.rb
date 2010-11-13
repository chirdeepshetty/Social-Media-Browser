ActionController::Routing::Routes.draw do |map|

  map.homepage "", :controller => "home", :action => "search"
  map.search "/search", :controller => "home", :action => "search"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
