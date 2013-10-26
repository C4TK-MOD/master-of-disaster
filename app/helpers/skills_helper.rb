module SkillsHelper
  def skills_by_path
  end

  def skills_by_alphabetical_order
    Skill.all(order: :name)
  end
end
