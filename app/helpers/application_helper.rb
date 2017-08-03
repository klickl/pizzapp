module ApplicationHelper


  def col
    mcol = 9
    lcol = 10
    if @links == nil
      mcol += 3
      lcol += 2
    end
    ' m' + mcol.to_s + ' l'+lcol.to_s
  end

  def is_active?(actionName)
    actionName == @side_action ? 'active' : ''
  end

  def is_menu_active?(menuName)
    menuName == @menu_name ? 'active' : ''
  end

  def number_notifications
    result = 0
    if @notifications != nil
      result = @notifications.size
    end
    result
  end

  def add_offset(index)
    result = ''
    if index != nil
      if index % 2 == 1
        result = 'offset-l2'
      end
    end
    result
  end
end
