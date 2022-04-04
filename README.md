# dotfiles

Configures a clean macOS and/or Windows and/or WSL install to my liking. 

## Windows - gaming (default)

To download this project, open a *normal* command prompt and run:
- `cd Desktop`
- `winget install Git.Git`
- `git clone https://github.com/crawlem/dotfiles.git`
- `cd dotfiles`

Then choose a profile:
- `.\install.bat` default gaming PC
- `.\install.bat dev` software development environment
- `.\install.bat work` work environment

### Dev profile

The `dev` profile requires an Ubuntu WSL environment to be installed. Once it is, run `install_linux.sh` from the WSL command prompt.

### CSGO config

- Install CSGO using Steam
- Copy CS:GO cfg files in `SteamLibrary\steamapps\common\Counter-Strike Global Offensive\csgo\cfg`
- Edit the Steam launch options `-noborder -fullscreen -novid +exec mark`

## macOS

Run `install_macos.sh`.