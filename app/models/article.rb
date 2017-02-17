class Article < ActiveRecord::Base
    belongs_to :user
    validates :title ,presence:true ,length: {minimum: 3,maximum: 50}
    validates :description ,presence:true ,length: {minimum: 10,maximum: 5000}
    has_many :article_categories
    has_many :categories, through: :article_categories

end