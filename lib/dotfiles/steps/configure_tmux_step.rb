class Dotfiles::Step::ConfigureTmuxStep < Dotfiles::Step
  def self.depends_on
    [Dotfiles::Step::InstallBrewPackagesStep]
  end

  def run
    debug "Configuring Tmux..."
    tmux_config_file = home_path("tmux_config_file")

    @system.mkdir_p(File.dirname(tmux_config_file))
    @system.cp(dotfiles_source("tmux_config"), tmux_config_file)
  end

  def complete?
    tmux_config_file = home_path("tmux_config_file")
    return false unless @system.file_exist?(tmux_config_file)

    source_config = dotfiles_source("tmux_config")
    files_match?(source_config, tmux_config_file)
  end

  # Sync current Tmux config back into dotfiles
  def update
    tmux_config_file = home_path("tmux_config_file")
    dest_config = dotfiles_source("tmux_config")

    return unless tmux_config_file && dest_config

    # Sync .tmux.conf if it has changed
    @system.mkdir_p(File.dirname(dest_config))
    if @system.file_exist?(tmux_config_file) && !files_match?(tmux_config_file, dest_config)
      @system.cp(tmux_config_file, dest_config)
    end
  end
end