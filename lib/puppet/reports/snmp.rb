require 'puppet'
require 'yaml'

begin
  require 'snmp'
rescue LoadError => e
  Puppet.info "You need the `snmp` library to use the snmp report"
end

Puppet::Reports.register_report(:snmp) do

  configfile = File.join([File.dirname(Puppet.settings[:config]), "snmp.yaml"])
  raise(Puppet::ParseError, "SNMP report config file #{configfile} not readable") unless File.exist?(configfile)
  config = YAML.load_file(configfile)
  SNMP_SERVER = config[:snmp_server]

  desc <<-DESC
  Send notification of failed reports to an SNMP server.
  DESC

  def process
    if self.status == 'failed'
      Puppet.debug "Sending status for #{self.host} to SNMP server at #{SNMP_SERVER}"
      SNMP::Manager.open(:Host => "#{SNMP_SERVER}",:Version => :SNMPv1) do |snmp|
        snmp.trap_v2(12345, "1.3.6.1.4.1.34380.1.1.1.5")
      end
    end
  end
end
