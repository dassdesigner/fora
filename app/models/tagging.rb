class Tagging < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag
  validates_uniqueness_of :question_id, :scope => :tag_id
end
