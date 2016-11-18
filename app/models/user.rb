class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :user
  include PgSearch

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :links

    pg_search_scope(
    :search,
    against: %i(
      body
    ),
    using: {
      tsearch: {
        dictionary: "english",
          tsvector_column: "tsv"
      }
    }
  )
end