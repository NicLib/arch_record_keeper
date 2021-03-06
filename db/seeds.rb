require 'nokogiri'

doc = File.open('/app/assets/data/old_data.xml') {|f| Nokogiri::XML(f)}

doc.css('request').each do |node|
    Job.create(
        :last_name => node['name'],
        :telephone => node['phone'],
        :street_address => node['address'],
        :city => node['city'],
        :state => node['state'],
        :zip => node['zip'],
        :email => node['email'],
        :au_chog => node['chogAu'],
        :person_type => node['affil'],
        :research_use => node['use'],
        :subject => node['subject'],
        :notes => node['note'],
        :start_date => node['startDate'],
        :end_date => node['addDate'],
        :complete => true,
        :time_spend => node['hours']
    )
end
