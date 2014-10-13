ActiveAdmin.register Background do


  show do |bkg|
    attributes_table do
      row :image do
        image_tag(bkg.image.url(:thumb))
      end
    end
    active_admin_comments
  end

  controller do
    def permitted_params
      params.permit background: [:image]
    end
  end


end
