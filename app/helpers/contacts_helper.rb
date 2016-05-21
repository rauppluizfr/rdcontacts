module ContactsHelper

  def has_to_block?
    action_name == "show"
  end
end
