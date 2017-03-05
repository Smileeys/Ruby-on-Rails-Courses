require_relative '../config/environment'

class Assignment

  def create_user(params)
      User.create(params)
  end

  def create_todolist(params)
      TodoList.create(list_name: params[:name], list_due_date: params[:due_date])
  end

  def find_allusers(offset, limit)
      User.all.order(:updated_at).offset(offset).limit(limit)
  end

  def find_alllists(offset, limit)
    TodoList.all.order(list_due_date: :desc).offset(offset).limit(limit)
  end

  def find_user_byname(username)
      User.where(username: username)
  end 

  def find_todolist_byname(name)
    TodoList.where(list_name: name)
  end     

  def get_user_byid(id)
    User.find_by(id: id)
  end

  def get_todolist_byid(id)
    TodoList.find_by(id: id)
  end

  def update_password(id, password_digest)
      usr = get_user_byid(id)
      unless usr.nil? 
        usr.update(password_digest: password_digest)
      end
  end

  def update_listname(id, name)
      lst = get_todolist_byid(id)
      unless lst.nil?
        lst.update(list_name: name)
      end
  end 

  def delete_user(id)
      usr = get_user_byid(id)
      unless usr.nil? 
        User.delete(usr.id)
      end
  end 

  def delete_todolist(id)
      lst = get_todolist_byid(id)
      unless lst.nil? 
        TodoList.delete(lst.id)
      end
  end
end
