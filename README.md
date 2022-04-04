# dotfiles

Configures a clean macOS and/or Windows and/or WSL install to my liking. 

## Windows

To download this project, open a *normal* command prompt and run:
- `cd Desktop`
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

The `dev` profile requires an Ubuntu WSL environment to be installed. This can be done from the Windows Store.

Once Ubuntu is installed, open a terminal to it and run `install_linux.sh`.

#### Running on Hyper-V

If you are running WSL in a Hyper-V virtual machine, virtualisation extensions are required. Run `Set-VMProcessor -VMName <name of VM> -ExposeVirtualizationExtensions $true` on the host PC as Administrator while the guest VM is shut down.

### Gaming profile

- Install CSGO using Steam
- Copy CS:GO cfg files in `SteamLibrary\steamapps\common\Counter-Strike Global Offensive\csgo\cfg`
- Edit the Steam launch options `-noborder -fullscreen -novid +exec mark`

## macOS

Run `install_macos.sh`.