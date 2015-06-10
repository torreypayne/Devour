class Card < ActiveRecord::Base
  validates :deck_id, :question, :answer, :next_rep, :e_factor, :last_passed, presence: true

  after_initialize :set_repetitions
  after_initialize :ensure_time_interval
  after_initialize :ensure_e_factor
  after_initialize :set_initial_time

  belongs_to :deck

  attr_accessor :next_rep, :e_factor, :repetitions, :last_passed

  def repetitions=(repetitions)
    self.repetitions ||= 0
  end

  def next_rep=(next_rep)
    self.next_rep ||= 1
  end

  def e_factor=(e)

  end

  def last_passed=(last_pass)

  end


  def set_repetitions
    if self.repetitions.nil?
      self.repetitions = 0
    end
  end

  def ensure_time_interval
    if (self.repetitions == 0 || self.repetitions.nil?)
      self.next_rep = 1
    end
  end

  def ensure_e_factor
    if self.e_factor.nil?
      self.e_factor = 2.5
    end
  end

  def set_initial_time
    self.last_passed ||= Time.now
  end

  def assess_response(quality)
    e_factor = e_factor - 0.8 + 0.28*quality - 0.02*(quality*quality)
    if (quality > 1)
      self.set_time_interval(quality)
      self.last_passed = Time.now
    else
      self.repetitions = 0
    end
  end

  def set_time_interval(quality)
    if (repetition == 1)
      if (quality < 4)
        next_rep = 1
      elsif (quality < 5)
        next_rep = 2
      else
        next_rep = 3
      end
    else
      next_rep *= e_factor.round
    end
  end

end
