ActionController::Routing::Routes.draw do |map|
  map.search '/code_documents/search', :controller => 'code_documents', :action => 'search'
  map.resources :code_documents
  map.connect 'codebook/:action.:format', :controller => 'codebook'
end
