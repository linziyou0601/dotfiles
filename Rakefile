# encoding: UTF-8

# mac 檢查 homebrew git oh-zshrc
require "rake"

GREEN = "\033[0;32m"
NONE  = "\033[0m"

desc "install dot files to $HOME directory"

task :install do
  welcome_message
  install_homebrew
  install_oh_my_zsh
  move_zsh_themes
  install_dotfile
end

private

def run(cmd)
  puts "\033[0;33m[Running]\033[0m #{cmd}"
  `#{cmd}`
end

def welcome_message
  puts GREEN + " _                                                 ___           _    ___       _                      " + NONE
  puts GREEN + "( )     _               _                         (  _`\\        ( )_ (  _`\\  _ (_ )                  " + NONE
  puts GREEN + "| |    (_)  ___   ____ (_) _   _    _    _   _    | | ) |   _   | ,_)| (_(_)(_) | |    __    ___       " + NONE
  puts GREEN + "| |  _ | |/' _ `\\(_  ,)| |( ) ( ) /'_`\\ ( ) ( )   | | | ) /'_`\\ | |  |  _)  | | | |  /'__`\\/',__)  " + NONE
  puts GREEN + "| |_( )| || ( ) | /'/_ | || (_) |( (_) )| (_) |   | |_) |( (_) )| |_ | |    | | | | (  ___/\\__, \\    " + NONE
  puts GREEN + "(____/'(_)(_) (_)(____)(_)`\\__, |`\\___/'`\\___/'   (____/'`\\___/'`\\__)(_)    (_)(___)`\\____)(____/" + NONE 
  puts GREEN + "                          ( )_| |                                                                      " + NONE
  puts GREEN + "                          `\\___/'                                                                     " + NONE

  puts
  puts GREEN + "======================================================" + NONE
  puts GREEN + "This is Linziyou's DotFiles Installation."              + NONE
  puts GREEN + "======================================================" + NONE
  puts
end

def install_dotfile
  files = Dir['.*'] - %w[. .. .DS_Store .git .gitignore .oh-my-zsh .config]
  files << Dir.glob(".oh-my-zsh/custom/*")
  files << Dir.glob(".config/fish/*")
  files = files.flatten
  files.delete_if { |x| x.match(/\.\w+\.sw[a-z]/) }

  puts GREEN + "======================================================" + NONE
  puts GREEN + "Looking for existing config and backing up it..."       + NONE
  puts GREEN + "======================================================" + NONE
  puts
  backup_files(files)
end

def backup_files(files)
  # 當沒有 ~/.dotfiles_backup 目錄時，建立一個
  run %{mkdir -p #{ENV["HOME"]}/.dotfiles_backup} unless File.exists?("#{ENV["HOME"]}/.dotfiles_backup")

  files.each do |file|
    target = "#{ENV["HOME"]}/#{file}"

    if File.exist?("#{target}")
      # 當 ~/<file> 的symbol link存在時，刪除
      run %{rm -rf #{target}} if File.symlink?("#{target}")
      # 當 ~/<file> 的檔案或目錄存在時，備份
      run %{mv #{target} #{ENV["HOME"]}/.dotfiles_backup} if File.file?("#{target}") || File.directory?("#{target}")
    end
  end

  link_files(files)
end

def link_files(files)
  puts
  puts GREEN + "======================================================" + NONE
  puts GREEN + "Setting up symbol link files..."                        + NONE
  puts GREEN + "======================================================" + NONE
  puts

  # 將 ~/.dotfiles/<file> 建立symbol link到 ~/<file>
  files.each do |file|
    source = "#{ENV["PWD"]}/#{file}"
    target = "#{ENV["HOME"]}/#{file}"

    run %{ln -s #{source} #{target}}
  end

  success_msg
end

def install_homebrew
  puts GREEN + "======================================================" + NONE
  puts GREEN + "Looking for homebrew and install it..."                 + NONE
  puts GREEN + "======================================================" + NONE
  puts

  unless `brew -v`.empty?
    puts 'homebrew already to install'
  else
    run %{curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sh}
  end

  run %{brew bundle --file #{Dir.pwd}/Brewfile}
end

def install_oh_my_zsh
  puts GREEN + "======================================================" + NONE
  puts GREEN + "Looking for oh-my-zsh and install it..."                + NONE
  puts GREEN + "======================================================" + NONE
  puts
  oh_my_zsh = "#{ENV["HOME"]}/.oh-my-zsh"
  unless File.exists?(oh_my_zsh)
    run %{curl -L https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh}
  else
    puts 'oh-my-zsh already to install'
  end
end

def move_zsh_themes
  puts GREEN + "======================================================" + NONE
  puts GREEN + "Linking oh-my-zsh theme..."                             + NONE
  puts GREEN + "======================================================" + NONE
  puts
  source = "#{Dir.pwd}/.oh-my-zsh/themes/powerlevel10k"
  target = "#{Dir.home}/.oh-my-zsh/custom/themes/powerlevel10k"
  puts "link zsh_themes from #{target} -> #{source}"

  run %{ rm -rf #{target}.backup} if File.exists?(target + ".backup")
  run %{ mv #{target} #{target}.backup}
  run %{ln -s #{source} #{target}}
end

def success_msg
  puts 'DotFiles intall done.'
end