Rails.application.routes.draw do

  get 'aphorisms/rules' => 'aphorisms#rules', as: 'rules'
  get 'aphorisms/first_step' => 'aphorisms#step_one', as: 'step_one'
  get 'aphorisms/second_step' => 'aphorisms#step_two', as: 'step_two'
  get 'aphorisms/third_step/:picture_id' => 'aphorisms#step_three', as: 'step_three'
  post 'make_aphorism' => 'aphorisms#make_aphorism', as: 'make_aphorism'

  root 'aphorisms#home'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
