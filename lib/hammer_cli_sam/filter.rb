module HammerCLISAM
  HammerCLI::MainCommand.find_subcommand('filter').subcommand_class

  module FilterCommand

    class CreateCommand < HammerCLIForeman::Filter::CreateCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:location)
    end

    class UpdateCommand < HammerCLIForeman::Filter::UpdateCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:location)
    end

  end

  HammerCLIForeman::Filter.subcommand!(
    HammerCLIForeman::Filter::CreateCommand.command_name,
    HammerCLIForeman::Filter::CreateCommand.desc,
    HammerCLISAM::FilterCommand::CreateCommand
  )

  HammerCLIForeman::Filter.subcommand!(
    HammerCLIForeman::Filter::UpdateCommand.command_name,
    HammerCLIForeman::Filter::UpdateCommand.desc,
    HammerCLISAM::FilterCommand::UpdateCommand
  )

end
