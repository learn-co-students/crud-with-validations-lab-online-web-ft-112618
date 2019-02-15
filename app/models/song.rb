class Song < ActiveRecord::Base

  validates :title, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}
  end

  validates :title, uniqueness: true

  def released?
    released
  end
end
