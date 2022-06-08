class MuseumDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def open_at_range
    "#{l(self.open_start_at, format: :long)}〜#{l(self.open_end_at, format: :long)}" if self.open_start_at.present? || self.open_end_at.present?
  end

end
