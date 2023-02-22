class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {
        in: %w(Fiction Non-Fiction)
    }
    validate :title_is_clickbate

    def title_is_clickbate
        if (title.present?)
            if (!title.match("Won't Believe" || "Secret" || "Top #{number}" || "Guess"))
            errors.add(:title, "Title isn't clickbate-y")
            end
        end
    end

end
