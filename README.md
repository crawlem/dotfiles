# dotfiles

Configures a clean macOS and/or Windows and Linux (WSL) install to my liking. Uses [Chocolatey](https://chocolatey.org/) as a Windows package manager. 

## Windows

Run `install_linux.bat` in an admin command prompt in Windows 10.

Then install Ubuntu WSL from the Microsoft Store, and run `install.sh` as a user (not root).

### Stuff that isn't covered

#### Software
- Logitech G Hub
- Rockstar Games
- [Backblaze](https://help.backblaze.com/hc/en-us/articles/217666358-Transfer-Backup-State?_ga=2.42309538.627218732.1605173523-2125565141.1605173523)
- Microsoft Whiteboard
- Minecraft

#### Games
Copy CS:GO cfg files in `SteamLibrary\steamapps\common\Counter-Strike Global Offensive\csgo\cfg`. Edit the Steam launch options `-noborder -fullscreen -novid +exec mark`

#### Plex
See https://support.plex.tv/articles/201370363-move-an-install-to-another-system/

# macOS

Run `install_macos.bat` from the command prompt.