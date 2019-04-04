class Song < ApplicationRecord

    validates_presence_of :title, :artist_name
    validates_uniqueness_of :title 
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: {less_than_or_equal_to: Date.current.year}, if: :released

end
