# My Linux Mint Debian Edition Config
## Dotfiles
### .bashrc (Arch Linux like prompts with git support)
- Bullet Train prompt based off [Lucas .bashrc final Linux commit](https://github.com/ChevySSinSD/bashrc)
- Note: must install powerline fonts to work properly (see below)

### mpv.conf and ~/.config/autostart/ (Play with MPV)
Set up chrome extension and python server that allows you to play videos in webpages with MPV instead of browser.
1. [Add debian multimedia repositories to apt get correct version of MPV and dependencies](https://hackernoon.com/install-deb-multimedia-repositories-on-debian-and-kali-linux-vy5o3y4q) (need version high enough to support yt-dlp)
1. Install MPV with apt
1. Install [yt-dlb](https://github.com/yt-dlp/yt-dlp#installation) 
1. Next, follow these directions to configure MPV with yt-dlb: [Replace youtube-dl With yt-dlp](https://www.funkyspacemonkey.com/replace-youtube-dl-with-yt-dlp-how-to-make-mpv-work-with-yt-dlp)
1. Follow instructions to install Chrome extension: [Play with MPV](https://github.com/Thann/play-with-mpv)
1. Set Play with MPV to run on starup: 'cp ~/.local/share/applications/thann.play-with-mpv.desktop ~/.config/autostart'

### ~/.config/rofi/config.rasi (Rofi)
Set theme, icons, fonts, modes for Rofi

## Setting Up This Repository
[How to store dotfiles | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

## My other installed repositories (on top of default LMDE)
[![Gimp Gnu Image Manipulation Program](https://img.shields.io/badge/Gimp-657D8B?style=for-the-badge&logo=gimp&logoColor=FFFFFF)](https://packages.debian.org/gimp)
[![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)](https://packages.debian.org/git)
[![Google Chrome](https://img.shields.io/badge/Google%20Chrome-4285F4?style=for-the-badge&logo=GoogleChrome&logoColor=white)](https://www.google.com/intl/en_us/chrome/)
[![Inkscape](https://img.shields.io/badge/Inkscape-e0e0e0?style=for-the-badge&logo=inkscape&logoColor=080A13)](https://packages.debian.org/inkscape)
[![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54) PIP](https://packages.debian.org/python3-pip)
[![Spotify](https://img.shields.io/badge/Spotify-1ED760?style=for-the-badge&logo=spotify&logoColor=white)](https://www.spotify.com/us/download/linux/)
[![Steam](https://img.shields.io/badge/steam-%23000000.svg?style=for-the-badge&logo=steam&logoColor=white)](https://packages.debian.org/steam)
<br/>
[![Htop](https://upload.wikimedia.org/wikipedia/commons/5/5d/Breezeicons-apps-48-htop.svg) htop](https://packages.debian.org/htop)
[<img src="https://upload.wikimedia.org/wikipedia/commons/7/73/Mpv_logo_%28official%29.png" width=42 alt="MPV"> MPV](https://www.deb-multimedia.org/dists/testing/main/binary-amd64/package/mpv)
[Papirus Icons](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
[Powerline fonts](https://github.com/powerline/fonts)
[<img src="https://raw.githubusercontent.com/ranger/ranger-assets/f36bccaa8df4d345f9def63cb6e25ea1990ce99c/logo/ranger312.svg" width=42 alt="Ranger"> Ranger](https://packages.debian.org/ranger)
[Roboto Fonts](https://packages.debian.org/fonts-roboto)
[Rofi](https://packages.debian.org/rofi)

## OS Base Install
[![Linux Mint](https://img.shields.io/badge/Linux%20Mint-87CF3E?style=for-the-badge&logo=Linux%20Mint&logoColor=white) LMDE 5 "Elsie"](https://blog.linuxmint.com/?p=4287)
