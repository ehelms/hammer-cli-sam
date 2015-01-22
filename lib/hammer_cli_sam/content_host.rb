module HammerCLISAM

  commands = %w(
    create
    package
    package-group
    errata
  )

  commands.each do |cmd|
    HammerCLI::MainCommand.find_subcommand('content-host').subcommand_class.remove_subcommand(cmd)
  end

  module ContentHostCommand

    class ListCommand < HammerCLIKatello::ContentHostCommand::ListCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:environment)
    end

    class UpdateCommand < HammerCLIKatello::ContentHostCommand::UpdateCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:environment, :content_view, :location)
    end

  end

  HammerCLIKatello::ContentHostCommand.subcommand!(
    HammerCLIKatello::ContentHostCommand::ListCommand.command_name,
    HammerCLIKatello::ContentHostCommand::ListCommand.desc,
    HammerCLISAM::ContentHostCommand::ListCommand
  )

  HammerCLIKatello::ContentHostCommand.subcommand!(
    HammerCLIKatello::ContentHostCommand::UpdateCommand.command_name,
    HammerCLIKatello::ContentHostCommand::UpdateCommand.desc,
    HammerCLISAM::ContentHostCommand::UpdateCommand
  )

end
