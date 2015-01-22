module HammerCLISAM
  HammerCLI::MainCommand.find_subcommand('user').subcommand_class

  module UserCommand

    class ListCommand < HammerCLIForeman::User::ListCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:location)
    end

    class CreateCommand < HammerCLIForeman::User::CreateCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:location)
    end

    class UpdateCommand < HammerCLIForeman::User::UpdateCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:location, :default_location)
    end

  end

  HammerCLIForeman::User.subcommand!(
    HammerCLIForeman::User::ListCommand.command_name,
    HammerCLIForeman::User::ListCommand.desc,
    HammerCLISAM::UserCommand::ListCommand
  )

  HammerCLIForeman::User.subcommand!(
    HammerCLIForeman::User::CreateCommand.command_name,
    HammerCLIForeman::User::CreateCommand.desc,
    HammerCLISAM::UserCommand::CreateCommand
  )

  HammerCLIForeman::User.subcommand!(
    HammerCLIForeman::User::UpdateCommand.command_name,
    HammerCLIForeman::User::UpdateCommand.desc,
    HammerCLISAM::UserCommand::UpdateCommand
  )

end
