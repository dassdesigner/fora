class Answer < ActiveRecord::Base
  validates :author_id, :title, :body, :votes, presence: true
  belongs_to {
    :author,
    foreign_key: :author_id,
    class_name: "User",
    primary_key: :id
  }

  belongs_to :question    


end
