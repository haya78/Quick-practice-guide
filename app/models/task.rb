class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30}
  validate :validate_name_not_including_comma

  belongs_to :user

  scope :recent, ->{ oreder(created_at: :desc) }

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマは含めることはできません') if name&.include?(',')
  end
end
