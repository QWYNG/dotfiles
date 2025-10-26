class Dotfiles::Step::ConfigureStarshipStep < Dotfiles::Step
  def self.depends_on
    [Dotfiles::Step::InstallBrewPackagesStep]
  end

  def run
    debug "Configuring Starship..."
    starship_config_dir = File.expand_path("~/.config")
    starship_config_file = File.join(starship_config_dir, "starship.toml")

    @system.mkdir_p(starship_config_dir)
    @system.cp(dotfiles_source("starship_config"), starship_config_file)
  end

  def complete?
    starship_config_file = File.join(File.expand_path("~/.config"), "starship.toml")
    return false unless @system.file_exist?(starship_config_file)

    source_config = dotfiles_source("starship_config")
    files_match?(source_config, starship_config_file)
  end

  # Sync current Starship config back into dotfiles
  def update
    starship_config_file = File.join(File.expand_path("~/.config"), "starship.toml")
    dest_config = dotfiles_source("starship_config")

    return unless starship_config_file && dest_config

    # Sync starship.toml if it has changed
    @system.mkdir_p(File.dirname(dest_config))
    if @system.file_exist?(starship_config_file) && !files_match?(starship_config_file, dest_config)
      @system.cp(starship_config_file, dest_config)
    end
  end
end
