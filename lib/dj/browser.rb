require 'dnssd'
require File.expand_path('../../../config/environment', __FILE__)

module Dj
  class Browser

    def initialize
      browse
    end

    def browse
      browser = DNSSD::Service.new
      services = {}

      puts "Browsing for DJJour services\r\n"

      browser.browse '_djjour._tcp' do |reply|
        services[reply.fullname] = reply
        next if reply.flags.more_coming?

        services.sort_by { |_, service|
          [(service.flags.add? ? 0 : 1), service.fullname]
        }.each do |_, service|

          Library.create_or_update_from_dnssd_service(service)

          # add = service.flags.add? ? 'Add' : 'Remove'
          # puts "#{add} #{service.name} on #{service.domain}"

          # break unless service.flags.more_coming?
        end

        services.clear

        puts
      end
    end

  end
end