class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :click_bait_title

  def click_bait_title
    if title
      unless title.include?("Won't Believe") || 
        title.include?("Secret") || 
        title.include?("Guess")
          errors.add(:title, "title must be click bait")
      end
    end
  end
end
