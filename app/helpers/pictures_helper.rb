module PicturesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confrim'
      confirm_pictures_path
    elsif action_name == 'edit'
      @picture
    end
  end
end
