module BlogsHelper
   def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_instas_path
    elsif action_name == 'edit'
      insta_path
    end
  end
end


     