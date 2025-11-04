Rails.application.routes.draw do
  mount Sul::ViewComponents::Engine => "/sul-view_components"

  root to: "rails/welcome#index"
end
