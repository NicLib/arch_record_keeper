require 'nokogiri'

namespace :db do
    namespace :seed do

        desc 'Add old data to database'
        task :import_data => :environment do
            #Dir.glob("#{Rails.root}/lib/assets/data/*.xml").each {|file| load file}

            OLD_DATA = "#{Rails.root}/lib/assets/data/old_data.xml"

            doc = Nokogiri::XML(File.open(OLD_DATA)) do |config|
                config.options = Nokogiri::XML::ParseOptions::STRICT
            end

            doc.css("request").each do |node|
                Job.create(
                    :last_name => node['name'],
                    :telephone => node['phone'],
                    :street_address => node['address'],
                    :city => node['city'],
                    :state => node['state'],
                    :zip => node['zip'],
                    :email => node['email'],
                    :au_chog => node["chogAu"],
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
        end
    end
end
