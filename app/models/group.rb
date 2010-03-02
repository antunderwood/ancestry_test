# == Schema Information
#
# Table name: groups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  ancestry   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  has_many :members, :class_name => "Person", :through => :memberships
  has_many :memberships
  has_ancestry
  
  named_scope :with_name_like , lambda {|text| {:conditions => ["name like ?", "%#{text}%" ]}}
  named_scope :group_and_ancestors_of, lambda { |object| {:conditions => to_node(object).group_and_ancestor_conditions} }
  named_scope :group_and_ancestors_of_groups_joined_by, lambda { |person| {:conditions => Group.group_and_ancestor_conditions_for_groups(person.groups.collect{|g| g.id})} }
  def group_and_ancestors
    [self] + self.ancestors
  end
  def group_and_ancestor_conditions
    {self.base_class.primary_key => [self.id] + ancestor_ids}
  end
  def self.group_and_ancestor_ids_for_groups(group_id_array)
    group_id_array = [group_id_array] unless group_id_array.is_a?(Array)
    self.find(group_id_array).collect{|g| g.group_and_ancestors.collect{|group| group.id}}.flatten.uniq
  end
  def self.group_and_ancestor_conditions_for_groups(group_id_array)
    {Group.primary_key => Group.group_and_ancestor_ids_for_groups(group_id_array)}
  end

end
