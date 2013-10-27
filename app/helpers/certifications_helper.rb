module CertificationsHelper
  def prerequisite_selections(target=nil)
    conditions = nil
    if target && !target.new_record?
      conditions = ["id <> ?", target.id]
    end
    Certification.all(order: :name, conditions: conditions).map{|p|[p.name,p.id]}
  end
end
