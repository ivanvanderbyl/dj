class Library < ActiveRecord::Base
  has_many :tracks
  has_many :songs, :through => :tracks

  def self.create_or_update_from_dnssd_service(service)
    library = find_or_create_by_name(service.name)

    if service.flags.add?
      DNSSD::Service.new.resolve service do |r|
        # puts "#{r.name} on #{r.target}:#{r.port}"
        # puts "\t#{r.text_record.inspect}" unless r.text_record.empty?

        library.update_attribute(:url, url_for_hostname(r.target, r.port))
        break unless r.flags.more_coming?
      end

      library.update_attribute(:online, true)
    else
      library.update_attribute(:online, false)
    end

    p library
  end

  def self.url_for_hostname(hostname, port)
    "http://#{hostname}:#{port}"
  end
end
