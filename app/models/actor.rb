class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{first_name} #{last_name}"
  end

  def list_roles
    shows = self.shows.map {|show| show.name}
    chars = self.characters.map {|char| char.name}
    chars.zip(shows).join(" - ")
  end
end