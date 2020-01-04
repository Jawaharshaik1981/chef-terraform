#
# Author:: Ezra Pagel (<ezra@cpan.org>)
# License:: Apache License, Version 2.0
#

require "chef/knife"
require "chef/knife/base_vsphere_command"
require "chef/knife/search_helper"

# Manage power state of a virtual machine
# VsphereVmState extends the BaseVspherecommand
class Chef::Knife::VsphereVmState < Chef::Knife::BaseVsphereCommand
  include SearchHelper
  # The Different power states that vSphere reports
  POWER_STATES ||= {
    PS_ON => "powered on",
    PS_OFF => "powered off",
    PS_SUSPENDED => "suspended",
  }.freeze

  banner "knife vsphere vm state VMNAME (options)"

  common_options

  option :state,
    short: "-s STATE",
    long: "--state STATE",
    description: "The power state to transition the VM into; one of on|off|suspend|reboot"

  option :wait_port,
    short: "-w PORT",
    long: "--wait-port PORT",
    description: "Wait for VM to be accessible on a port"

  option :shutdown,
    short: "-g",
    long: "--shutdown",
    description: "Guest OS shutdown"

  option :recursive,
    short: "-r",
    long: "--recursive",
    description: "Search all folders"

  # The main run method for vm_state
  #
  def run
    $stdout.sync = true

    vmname = @name_args[0]
    if vmname.nil?
      show_usage
      ui.fatal("You must specify a virtual machine name")
      exit 1
    end

    vim_connection

    vm = get_vm_by_name(vmname) || fatal_exit("Could not find #{vmname}")

    state = vm.runtime.powerState

    if config[:state].nil?
      puts "VM #{vmname} is currently " + POWER_STATES[vm.runtime.powerState]
    else

      case config[:state]
      when "on"
        if state == PS_ON
          puts "Virtual machine #{vmname} was already powered on"
        else
          vm.PowerOnVM_Task.wait_for_completion
          puts "Powered on virtual machine #{vmname}"
        end
      when "off"
        if state == PS_OFF
          puts "Virtual machine #{vmname} was already powered off"
        else
          if get_config(:shutdown)
            vm.ShutdownGuest
            print "Waiting for virtual machine #{vmname} to shut down..."
            until vm.runtime.powerState == PS_OFF
              sleep 2
              print "."
            end
            puts "done"
          else
            vm.PowerOffVM_Task.wait_for_completion
            puts "Powered off virtual machine #{vmname}"
          end
        end
      when "suspend", "suspended"
        if state == PS_SUSPENDED
          puts "Virtual machine #{vmname} was already suspended"
        else
          vm.SuspendVM_Task.wait_for_completion
          puts "Suspended virtual machine #{vmname}"
        end
      when "reset"
        vm.ResetVM_Task.wait_for_completion
        puts "Reset virtual machine #{vmname}"
      when "reboot"
        vm.RebootGuest
        puts "Reboot virtual machine #{vmname}"
      end

      if get_config(:wait_port)
        print "Waiting for port #{get_config(:wait_port)}..."
        print "." until tcp_test_port_vm(vm, get_config(:wait_port))
        puts "done"
      end
    end
  end
end
