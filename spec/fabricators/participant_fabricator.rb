# == Schema Information
#
# Table name: participants
#
#  id                :integer          not null, primary key
#  student_id        :integer
#  state             :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  project_id        :integer
#  course            :integer
#  first_name        :string(255)
#  middle_name       :string(255)
#  last_name         :string(255)
#  edu_group         :string(255)
#  contingent_active :boolean
#  contingent_gpo    :boolean
#  undergraduate     :boolean
#

Fabricator(:participant) do
  student_id { Fabricate.sequence :student_id }
end
