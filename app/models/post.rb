class Post < ApplicationRecord
  belongs_to :host_user
  belongs_to :call_center_user
end
