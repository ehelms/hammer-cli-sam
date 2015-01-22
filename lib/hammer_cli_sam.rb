require 'hammer_cli_katello'

module HammerCLISAM

  commands = %w(
    architecture
    capsule
    compute-resource
    content-view
    domain
    environment
    erratum
    fact
    global-parameter
    gpg
    host
    hostgroup
    lifecycle-environment
    location
    medium
    model
    os
    package
    package-group
    partition-table
    proxy
    puppet-class
    puppet-module
    report
    sc-param
    subnet
    template
  )

  commands.each do |cmd|
    HammerCLI::MainCommand.remove_subcommand(cmd)
  end

  require 'hammer_cli_sam/exclude_mixin'

  require 'hammer_cli_sam/activation_key'
  require 'hammer_cli_sam/content_host'
  require 'hammer_cli_sam/filter'
  require 'hammer_cli_sam/organization'
  require 'hammer_cli_sam/product'
  require 'hammer_cli_sam/repository'
  require 'hammer_cli_sam/user'

end
