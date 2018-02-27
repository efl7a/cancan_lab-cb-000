class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  validates :user_id, presence: true

  def visible_to=(names)
    names_array = names.split(', ')
    names_array.each do |name|
      self.readers << User.where(name: name) unless self.readers.include? User.where(name: name)
    end
  end

  def visible_to
    names_array = self.readers.uniq.map do |user|
      user.name
    end
    names_array.join(", ")
  end

end
