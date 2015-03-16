ActiveAdmin.register Text do
  
  form partial: 'admin/texts/form'

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  controller do
    def permitted_params
      params.permit text: [:texts, :title, :home, :rules, :rating, :step1, :step2, :step3, :authorize]
    end
  end



end
