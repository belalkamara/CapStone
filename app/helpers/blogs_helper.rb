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

  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
  end
end
