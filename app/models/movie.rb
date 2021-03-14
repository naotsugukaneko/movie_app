class Movie < ApplicationRecord
    validates :title, presence: true
    validates :url, presence: true
    
    before_save do
        format_url = YoutubeUrlFormatter.format(url)
        if format_url.present?
            self.url = format_url
        else
            self.errors.add(:url, "YouTubeのURL以外は無効です")
        end
    end
end
