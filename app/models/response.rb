# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  card_id     :integer          not null
#  quality     :integer          not null
#  e_factor    :float            default(2.5), not null
#  next_rep    :integer          not null
#  repetitions :integer          default(0), not null
#  last_passed :float            default(1434164372236.362), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Response < ActiveRecord::Base
  validates :card_id, :user_id, :quality, :e_factor, :repetitions, :next_rep, :last_passed, presence: true
  after_initialize :after_initialize

  belongs_to :card
  belongs_to :user
  has_one :deck, through: :card

  def after_initialize
    self.repetitions ||= 0
    self.e_factor ||= 2.5
    self.last_passed ||= (Time.now - 1000.days.ago).to_f * 1000
    self.next_rep ||= 0
    # self.user_id = current_user.id
  end

  def assert_response(user_id)
    self.user_id = user_id
    self.e_factor = self.e_factor - 0.8 + 0.28*self.quality - 0.02*(self.quality*self.quality)
    if (self.e_factor < 1.3)
      self.e_factor = 1.3
    end

    if (self.e_factor > 2.5)
      self.e_factor = 2.5
    end

    if (self.quality > 1)
      increment_repetitions
      set_time_interval
      # last_passed = Time.now.to_f * 1000
      update_last_passed
      # debugger
    else
      self.repetitions = 0
      self.next_rep = 0
      debugger
    end
    self.save
    return self
  end

  def increment_repetitions
    if self.repetitions
      self.repetitions += 1
    else
      self.repetitions = 1
    end
  end

  # def update_e_factor(quality)
  #   assess_response(quality)
  # end

  def update_last_passed
    self.last_passed = Time.now.to_f * 1000
  end

  def set_time_interval
    if (self.repetitions  == 1)
      if (quality < 4)
        self.next_rep = 1
      elsif (quality < 5)
        self.next_rep = 2
      else
        self.next_rep = 3
      end
    else
      self.next_rep = (self.next_rep * self.e_factor).round
    end
  end

end
