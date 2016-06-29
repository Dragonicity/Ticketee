class State < ActiveRecord::Base

validates :name, presence: true
validates :color, presence: true

  def to_s
    name
  end

  def make_default!
    State.update_all(default: false)
    update!(default: true)
  end
end
