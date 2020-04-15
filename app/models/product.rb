class Product < ApplicationRecord
  has_one_attached :img
  validates :title, :description, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 1}
  validates :title, uniqueness: true
  validate :correct_image_type


  private

  def correct_image_type
    if img.attached? && !img.content_type.in?(%w(image/jpeg image/png ))
      errors.add(:img, 'Must be a JPEG or PNG')
    # elsif img.attached? == false
    #   errors.add(:img, 'required')
    end
  end

  def self.latest
    Product.order(:updated_at).last
  end

end
