class DateValidator < ActiveModel::Validator
  def validate(record)
    if record.date.past?
      record.errors[:date] << 'Cannot use a past date!'
    end
  end
end

class DateFormat < ActiveModel::Validator
  def validate(record)
    unless (record.date =~ /\d{4}\/\d{2}\/\d{2}/)
      record.errors[:date] << 'Date format is not valid'
    end
  end
end


class Event < ActiveRecord::Base
  include ActiveModel::Validations

  validates :organizer_name, presence: true
  validates_format_of :organizer_email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :title, uniqueness: true, presence: true
  validates :date, presence: true
  validates_with DateValidator
  # validates_with DateFormat

end