module SkillsHelper
  # def skills_by_path(path=nil)
  #   conditions = nil
  #   if path
  #     conditions = ["path_id <> ?", path.id]
  #   end
  #   Skill.all(order: :name, conditions: conditions)
  # end

  def skills_by_alphabetical_order
    Skill.all(order: :name)
  end
end
