module ActivitiesHelper
  def image_generator
    "logo-rtd.png"
  end

  def act_img img, type
    if img.model.image?
      img
    else type == 'image'
      image_generator
    end 
  end
end
