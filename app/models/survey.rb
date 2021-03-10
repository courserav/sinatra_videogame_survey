class Survey < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :console, :genre
end
