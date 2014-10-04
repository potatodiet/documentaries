Documentaries::Application.routes.draw do
  root("welcome#index")

  devise_for(:users)

  resources("reviews")
  patch("review" => "reviews#update", as: "review_update")

  resources("search")
  resources("documentaries")
  resources("users")
end
