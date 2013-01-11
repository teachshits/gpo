# encoding: utf-8
# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  number            :string(255)
#  approved_at       :date
#  chair_id          :integer
#  created_at        :datetime
#  updated_at        :datetime
#  type              :string(255)
#  state             :string(255)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :date
#  file_url          :text
#

class OpeningOrder < Order
  def available_projects
    chair.projects.draft.find_all do |project|
      project.opening_order.nil? || (project.opening_order == self && self.draft?)
    end
  end

  # для приказа
  def chairs_for_order_report
    chairs = []
    self.projects.each do |project|
      chairs.concat(project.participants.collect {|participant| participant.chair_abbr})
    end
    chairs.uniq!
    chairs.delete(self.chair.abbr)
    case chairs.length
    when 1
      "виза заведующего кафедрой #{chairs[0]}; "
    when 2
      "визы заведующих кафедрами #{chairs.join(', ')}; "
    end
  end

  private

  def after_enter_approved
    super
    projects.map(&:approve!)
  end

end
