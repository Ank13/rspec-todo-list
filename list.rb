class List
  attr_reader :title, :tasks

  def initialize(title, tasks = [])
    @title = title
    @tasks = tasks
  end

  def add_task(task)
    tasks << task
  end

  def complete_task(index)
    if index <= tasks.length
      tasks[index].complete!
    else
      raise InvalidTaskError
    end
  end

  def delete_task(index)
    if index <= tasks.length
      tasks.delete_at(index)
    else
      raise InvalidTaskError
    end
  end

  def completed_tasks
    tasks.select { |task| task.complete? }
  end

  def incomplete_tasks
    tasks.select { |task| !task.complete? }
  end
end

class InvalidTaskError < StandardError; end
