class Url < ApplicationRecord
  before_validation :generate_shortened, on: [:create]
  validates :original, presence: true, uniqueness: true
  validates :shortened, presence: true, uniqueness: true
  validates_format_of :original, :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  belongs_to :category, optional: true

  private

  def generate_shortened
    loop do
      self.shortened = SecureRandom.hex(4)
      break unless Url.where( shortened: self.shortened ).exists?
    end
  end
end
