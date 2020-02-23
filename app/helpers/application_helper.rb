module ApplicationHelper
    def full_title(page_title='')
        base_title = "Suggest"
        if page_title.empty?
          base_title
        else
          base_title
        end
    end

    def owner?(user)
      current_user == user
    end

    
end
