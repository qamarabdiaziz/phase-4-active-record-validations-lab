class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    private

  def clickbait_validator
    clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]

    unless clickbait_phrases.any? { |phrase| title&.include?(phrase) }
      errors.add(:title, "should be clickbait-y")
    end
  end

  validate :clickbait_validator
end
