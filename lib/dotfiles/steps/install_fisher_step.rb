class Dotfiles::Step::InstallFisherStep < Dotfiles::Step
  def self.depends_on
    [Dotfiles::Step::InstallBrewPackagesStep]
  end

  def run
    debug "Installing Fisher plugin manager for Fish shell..."
    fisher_install_script = 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
    execute("fish -c '#{fisher_install_script}'")
  end

  def complete?
    fish_functions_dir = home_path("fish_functions_dir")
    return false unless fish_functions_dir

    fisher_function_file = File.join(fish_functions_dir, "fisher.fish")
    @system.file_exist?(fisher_function_file)
  end
end