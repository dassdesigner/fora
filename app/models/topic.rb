class Topic < ActiveRecord::Base
  belongs_to :topicable, :polymorphic => :true
end
