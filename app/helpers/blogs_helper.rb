module BlogsHelper
  def picture_generator
    "logo-rtd.png"
  end

  def blog_img img, type
    if img.model.picture?
      img
    else type == 'picture'
      picture_generator
    end 
  end
end
