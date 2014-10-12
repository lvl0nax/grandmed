ActiveAdmin.register Picture do

  index do
    selectable_column
    column :id
    column :description
    column :author
    column :image do |pic|
      image_tag(pic.image.url(:thumb))
    end
    actions
  end

  show do |picture|
    attributes_table do
      row :description
      row :author
      row :image do
        image_tag(picture.image.url(:big))
      end
    end
    active_admin_comments
  end

  controller do
    def permitted_params
      params.permit picture: [:image, :description, :author]
    end
  end

end
