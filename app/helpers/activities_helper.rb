module ActivitiesHelper
  def image_generator(height:, width:)
    "http://via.placeholder.com/#{height}x#{width}"
  end

  def act_img img, type
    if img.model.image?
      img
    else type == 'image'
      image_generator(height:'300', width:'200')
    end 
  end
end
