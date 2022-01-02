# frozen_string_literal: true

class String
  def numeric_string?
    !Float(self).nil?
  rescue StandardError
    false
  end

  def to_numeric
    return unless numeric_string?

    if index('.')
      to_f
    else
      to_i
    end
  end
end
