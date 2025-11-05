# frozen_string_literal: true

Rails.application.routes.draw do
  mount SdrViewComponents::Engine => '/sdr_view_components'
  root to: 'rails/welcome#index'
end
