class Answer < ActiveRecord::Base
  validates :author_id, :title, :body, presence: true
  belongs_to(
    :author,
    foreign_key: :author_id,
    class_name: "User",
    primary_key: :id
  )

  belongs_to :question


end
