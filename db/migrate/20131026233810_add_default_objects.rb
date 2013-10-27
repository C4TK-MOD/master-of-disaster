class AddDefaultObjects < ActiveRecord::Migration
  def up
    attrs = {}
    attrs[:name] = "Orientation"
    attrs[:description] = "Basic introduction to the system"
    p1 = Path.create(attrs)
    attrs[:name] = "Family and Personal Preparedness"
    attrs[:description] = "Basic provision of group / family needs during disaster response"
    p2 = Path.create(attrs)
    attrs[:name] = "Neighborhood & City"
    attrs[:description] = "Restoration of services during disaster response"
    p3 = Path.create(attrs)
    attrs[:name] = "Spiritual Readiness"
    attrs[:description] = "Provision for spiritual support through counseling, prayer, etc."
    p4 = Path.create(attrs)
    attrs[:name] = "Leadership Roles"
    attrs[:description] = "Response resource coordination, leadership, and executive function"
    p5 = Path.create(attrs)
    attrs[:name] = "General"
    attrs[:description] = "General Certifications not tracked elsewhere"
    p6 = Path.create(attrs)

    attrs = {}
    attrs[:name] = "Basic Orientation"
    attrs[:description] = "Completion of overview and introduction to program."
    attrs[:path_id] = p1.id
    c1 = Certification.create(attrs)
    attrs[:name] = "Preparedness Peace Course"
    attrs[:description] = "Introduction to disaster response preparedness"
    attrs[:path_id] = p2.id
    c2 = Certification.create(attrs)
    attrs[:name] = "American Red Cross - CPR/AED"
    attrs[:description] = "Basic CPR training and certification"
    attrs[:path_id] = p2.id
    c3 = Certification.create(attrs)
    attrs[:name] = "CERT"
    attrs[:description] = "Fundamental Emergency Response certification"
    attrs[:path_id] = p3.id
    c4 = Certification.create(attrs)
    attrs[:name] = "CISM"
    attrs[:description] = "Fundamental Emergency Counseling certification"
    attrs[:path_id] = p3.id
    c5 = Certification.create(attrs)
    attrs[:name] = "Chaplaincy 1"
    attrs[:description] = "First course in Chaplaincy training"
    attrs[:path_id] = p3.id
    attrs[:prerequisite_id] = c5.id
    c6 = Certification.create(attrs)
    attrs[:name] = "Chaplaincy 2"
    attrs[:description] = "Second course in Chaplaincy training"
    attrs[:path_id] = p3.id
    attrs[:prerequisite_id] = c6.id
    c7 = Certification.create(attrs)
    attrs[:name] = "Chaplaincy 3"
    attrs[:description] = "Third course in Chaplaincy training"
    attrs[:path_id] = p3.id
    attrs[:prerequisite_id] = c7.id
    c8 = Certification.create(attrs)
    attrs.delete(:prerequisite_id)
    attrs[:name] = "HAM"
    attrs[:description] = "Radio operation for emergency situations"
    attrs[:path_id] = p3.id
    c9 = Certification.create(attrs)
    attrs[:name] = "ICS 100"
    attrs[:description] = "First course in Incident Command System"
    attrs[:path_id] = p3.id
    c10 = Certification.create(attrs)
    attrs[:name] = "ICS 200"
    attrs[:description] = "Second course in Incident Command System"
    attrs[:path_id] = p3.id
    attrs[:prerequisite_id] = c10.id
    c11 = Certification.create(attrs)

    attrs = {}
    attrs[:name] = "Cooking (Group)"
    attrs[:description] = "Ability to provide meals for at least 25 people"
    s1 = Skill.create(attrs)
    attrs[:name] = "Demolition"
    attrs[:description] = "Ability to demolish structures following a disaster"
    s2 = Skill.create(attrs)
    attrs[:name] = "Framing Carpentry"
    attrs[:description] = "Ability to frame new structures, but not necessarily at the level of a finish carpenter"
    s3 = Skill.create(attrs)

    attrs = {}
    attrs[:name] = "Construction"
    attrs[:area] = "Physical Assets"
    cat1 = Category.create(attrs)
    attrs = {}
    attrs[:name] = "Transportation"
    attrs[:area] = "Physical Assets"
    cat2 = Category.create(attrs)

    attrs = {}
    attrs[:name] = "Chain Saw"
    attrs[:category_id] = cat1.id
    pa1 = PhysicalAsset.create(attrs)
    attrs[:name] = "Generator"
    attrs[:category_id] = cat1.id
    pa2 = PhysicalAsset.create(attrs)
    attrs[:name] = "Truck"
    attrs[:category_id] = cat2.id
    pa3 = PhysicalAsset.create(attrs)
    attrs[:name] = "Bus"
    attrs[:category_id] = cat2.id
    pa4 = PhysicalAsset.create(attrs)

  end

  def down
  end
end
