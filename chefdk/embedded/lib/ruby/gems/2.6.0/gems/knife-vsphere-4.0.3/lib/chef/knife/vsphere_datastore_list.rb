# Copyright (C) 2012, SCM Ventures AB
# Author: Ian Delahorne <ian@scmventures.se>
#
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted, provided that the
# above copyright notice and this permission notice appear in all
# copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
# AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
# DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA
# OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
# TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE

require "chef/knife"
require "chef/knife/base_vsphere_command"

# Lists all known data stores in datacenter with sizes
# VsphereDatastorelist extends the BaseVspherecommand
class Chef::Knife::VsphereDatastoreList < Chef::Knife::BaseVsphereCommand
  banner "knife vsphere datastore list"

  common_options

  option :list,
    long: "--list",
    short: "-L",
    description: "Indicates whether to list VM's in datastore",
    boolean: true
  option :pool,
    long: "--pool pool",
    description: "Target pool"

  # The main run method for datastore_list
  #
  def run
    $stdout.sync = true

    vim_connection
    dc = datacenter
    folder = dc.hostFolder
    target_pool = get_config(:pool)

    pools = find_pools_and_clusters(folder, target_pool)
    if target_pool && pools.empty?
      fatal_exit("Pool #{target_pool} not found")
    end

    pool_info = pools.map do |pool|
      datastores = list_ds(pool)
      { "Pool" => pool.name, "Datastores" => datastores }
    end
    ui.output(pool_info)
  end

  private

  def list_vms(store)
    store.vm.map do |vm|
      host_name = vm.guest[:hostName]
      guest_full_name = vm.guest[:guest_full_name]
      guest_state = vm.guest[:guest_state]
      { "VM Name" => host_name, "OS" => guest_full_name, "State" => guest_state }
    end
  end

  def list_ds(pool)
    pool.datastore.map do |store|
      avail = number_to_human_size(store.summary[:freeSpace])
      cap = number_to_human_size(store.summary[:capacity])
      ds_info = { "Datastore" => store.name, "Free" => avail, "Capacity" => cap }
      ds_info["Vms"] = list_vms(store) if get_config(:list)
      ds_info
    end
  end
end
