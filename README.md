# dotfiles

Configures a clean macOS and/or Windows and/or WSL install to my liking. 

## Windows - gaming (default)

Open a *normal* command prompt and run:
- `cd Desktop`
- `winget install Git.Git`
- `git clone https://github.com/crawlem/dotfiles.git`

Open a *PowerShell administrator* command prompt and run:
- `cd c:\Users\User\Desktop\dotfiles`
- `install.bat`

### CSGO config

- Install CSGO using Steam
- Copy CS:GO cfg files in `SteamLibrary\steamapps\common\Counter-Strike Global Offensive\csgo\cfg`
- Edit the Steam launch options `-noborder -fullscreen -novid +exec mark`

## Windows - dev

Run `install.bat dev` from a *PowerShell administrator* command prompt.

Then install Ubuntu WSL from the Microsoft Store, open a terminal and run `install_linux.sh` as a user (not root).

## Windows - work

Run `install.bat work` from a *PowerShell administrator* command prompt.

## macOS

Run `install_macos.sh`.