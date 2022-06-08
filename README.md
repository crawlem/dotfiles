# dotfiles

Configures a clean macOS and/or Windows and/or WSL install to my liking. 

## Windows

To download this project, open a *normal* command prompt and run:
- `winget install Git.Git`
- Close and open a new command prompt
- `cd Desktop`
- `git clone https://github.com/crawlem/dotfiles.git`
- `cd dotfiles`

Then choose a profile:
- `.\install.bat gaming` default gaming PC
- `.\install.bat dev` software development environment
- `.\install.bat work` work environment

### Dev profile

The `dev` profile can utilise an Ubuntu WSL environment. This can be installed from the Windows Store. Once installed, open a terminal to it and run `install_linux.sh` from this repo.

#### Running on Hyper-V

Enabling 1Password SSH Agent in a Hyper-V guest requires Windows Hello to be setup in the VM. To do this the connection need to have "Enhanced session" disabled on the View menu.

### Gaming profile

- Install CSGO using Steam
- Copy CS:GO cfg files in `SteamLibrary\steamapps\common\Counter-Strike Global Offensive\csgo\cfg`
- Edit the Steam launch options `-noborder -fullscreen -novid +exec mark`

## macOS

Run `install_macos.sh`.
