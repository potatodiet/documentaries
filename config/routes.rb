Documentaries::Application.routes.draw do
  root("welcome#index")

  devise_for("users")

  resources("reviews")
  resources("search")
  resources("documentaries")
  resources("users")
end
