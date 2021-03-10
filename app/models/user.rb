class User < ActiveRecord::Base
    has_secure_password
    has_many :surveys
    validates_presence_of :username, :password
    validates_uniqueness_of :username, case_sensitive: false

    include Slug
    extend FindBySlug
end