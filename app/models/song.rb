class Song < ActiveRecord::Base
  validates :title, :genre, :artist_name, presence:true
  validates :released, inclusion: { in: [true, false] }
  validates :title, uniqueness: true
  validate :unreleased

  def unreleased
    if (released == true && release_year.nil?) || (released == true && release_year > Time.new.year)
      errors.add(:unreleased, "Needs a release year if song has been released and also can't be a date in the future.")
    end
  end
end
