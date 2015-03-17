Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  get 'aphorisms/rules' => 'aphorisms#rules', as: 'rules'
  get 'aphorisms/ratings' => 'aphorisms#rating', as: 'ratings'
  get 'aphorisms/first_step' => 'aphorisms#step_one', as: 'step_one'
  get 'aphorisms/second_step' => 'aphorisms#step_two', as: 'step_two'
  get 'aphorisms/third_step/:picture_id' => 'aphorisms#step_three', as: 'step_three'
  get 'aphorisms/vk_answer' => 'aphorisms#vk_answer', as: 'vk_answer'
  post 'make_aphorism' => 'aphorisms#make_aphorism', as: 'make_aphorism'
  post 'update_aphorism' => 'aphorisms#update_aphorism', as: 'update_aphorism'

  root 'aphorisms#home'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
