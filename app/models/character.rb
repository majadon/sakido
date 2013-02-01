# == Schema Information
#
# Table name: characters
#
#  id               :integer          not null, primary key
#  jobid            :integer
#  weight           :integer
#  hpfactor         :integer
#  hpmultiplicator  :integer
#  spfactor         :integer
#  unarmed          :integer
#  dagger           :integer
#  oneh_sword       :integer
#  twoh_sword       :integer
#  oneh_spear       :integer
#  twoh_spear       :integer
#  oneh_axe         :integer
#  twoh_axe         :integer
#  oneh_mace        :integer
#  twoh_mace_unused :integer
#  rod              :integer
#  bow              :integer
#  knuckle          :integer
#  instrument       :integer
#  whip             :integer
#  book             :integer
#  katar            :integer
#  revolver         :integer
#  rifle            :integer
#  gatling_gun      :integer
#  shotgun          :integer
#  grenade_launcher :integer
#  fuuma_shuriken   :integer
#  twoh_staff       :integer
#  shield           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  jobname          :string(255)
#

class Character < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :jobid

  def to_s
  	"#{self.jobname}"
  end

  def to_param
    "#{self.id}-#{self.to_s.parameterize}"
  end

end
