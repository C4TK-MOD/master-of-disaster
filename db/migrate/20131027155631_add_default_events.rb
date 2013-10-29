class AddDefaultEvents < ActiveRecord::Migration
  def up

    attrs = {}
    
    attrs[:name] = "Austin Flooding"
    attrs[:description] = "Homes along Williamson Creek and other creeks were affected but the rising flood waters. Some experienced very little water damage while others experienced up to 3 feet of water. To date, there are 5 families asking to be sponsored and a few who need short term clean up assistance. ADRN is expecting more families to seek sponsorship over the next few days."
    attrs[:city] = "Austin"
    attrs[:state] = "TX"
    attrs[:zip] = 78744
    attrs[:image_url] = "/assets/austinflood.jpg"
    e1 = Event.create(attrs)

    attrs[:name] = "Tornado Cleanup"
    attrs[:description] = "ADRN deployed an assessment team within 24 hours after the massive tornado brought devastation to the community of Moore, Oklahoma. ADRN, and our network of churches in Greater Austin, activated and deployed Emotional Care and Chaplaincy teams daily to the hardest hit areas of Moore, OK as part of our response efforts to meet the emotional and spiritual needs of storm survivors. To date, over 1,100 families have been debriefed with over 1,000 applications from families that are looking for sponsorship. ADRN is receiving amazing response from our outreach to local churches and pastors in the Greater Oklahoma City area to build a church network to work together to sponsor families and walk beside them during recovery. The first of many meetings have been held to train and equip the volunteers to shepherd the families. ADRN continues outreach to help sponsor the remaining families in need of assistance. Please pray for the OKC network. The need is still so great."
    attrs[:city] = "Moore"
    attrs[:state] = "OK"
    attrs[:zip] = 78744
    attrs[:image_url] = "/assets/tornado-OK.jpg"
    e2 = Event.create(attrs)

  end

  def down
  end
end
