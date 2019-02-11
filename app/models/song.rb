class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :not_repeated
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_if_released
  validates :artist_name, presence: true

  def not_repeated
    if Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
      errors.add(:title, "cannot be repeated by the same artist in the same year")
    end
  end

  def release_year_if_released
    if released && (!(release_year) || release_year > Date.today.year)
      errors.add(:release_year, "is invalid")
    end
  end
end
