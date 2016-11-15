module ApplicationHelper
  def show_avatar user
    if user.avatar?
      link_to image_tag(user.avatar, alt: "#{user.name}", size: "130x130",
        class: "avatar"), user
    else
      link_to image_tag("user-default.png", alt: user.name,
        size: "130x130", class: "avatar" ), user
    end
  end
end
