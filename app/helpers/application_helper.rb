module ApplicationHelper
  def show_avatar user
    if user.avatar?
      link_to image_tag(user.avatar, alt: "#{user.name}", size: "64x64",
        class: "avatar"), user
    else
      link_to image_tag("user-default.png", alt: user.name,
        size: "64x64", class: "avatar" ), user
    end
  end

  def show_avatar_mini user
  	if user.avatar?
	      link_to image_tag(user.avatar, alt: "#{user.name}", size: "30x30",
	        class: "avatar"), user
	    else
	      link_to image_tag("user-default.png", alt: user.name,
	        size: "30x30", class: "avatar" ), user
	 end
  end
end
