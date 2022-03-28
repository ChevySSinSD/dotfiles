# My Linux Debian i3 Gaps Config
## [![Debian](https://img.shields.io/badge/Debian-D70A53?style=for-the-badge&logo=Debian)](https://debian.org) Base Install
- [Debian non free firmware net install (11.3.0 as of 26MAR2022)](https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/current/amd64/iso-cd/)
- Manual config of /etc/network/interfaces to get wifi up

## i3 Gaps Install
1. Install git
1. Install [i3 Gaps Debian](https://github.com/maestrogerardo/i3-gaps-deb)
1. Install xorg lightdm [pulseaudio](https://wiki.debian.org/PulseAudio) pavucontrol dex
1. Download and install [Google Chrome](https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb)
1. Add [Debian multimedia repository](https://deb-multimedia.org/)

## Setting Up This Repository
1. [Set up git SSH keyring](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
1. [How to store dotfiles | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

## My other installed repositories (on top of default LMDE)
[![Gimp Gnu Image Manipulation Program](https://img.shields.io/badge/Gimp-657D8B?style=for-the-badge&logo=gimp&logoColor=FFFFFF)](https://packages.debian.org/gimp)
[![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)](https://packages.debian.org/git)
[![htop](https://img.shields.io/badge/htop-009020?style=for-the-badge&logo=windows+terminal)](https://packages.debian.org/htop)
[![Google Chrome](https://img.shields.io/badge/Chrome-4285F4?style=for-the-badge&logo=GoogleChrome&logoColor=white)](https://www.google.com/intl/en_us/chrome/)
[![Inkscape](https://img.shields.io/badge/Inkscape-e0e0e0?style=for-the-badge&logo=inkscape&logoColor=080A13)](https://packages.debian.org/inkscape)
[![Python](https://img.shields.io/badge/pip-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)](https://packages.debian.org/python3-pip)
[![Ranger](https://img.shields.io/badge/Ranger-FF7F12?style=for-the-badge&logo=windows+terminal)](https://packages.debian.org/ranger)
[![Rofi](https://img.shields.io/badge/Rofi-000000?style=for-the-badge&logo=windows+terminal)](https://packages.debian.org/rofi)
<br/>
[<img src="https://upload.wikimedia.org/wikipedia/commons/7/73/Mpv_logo_%28official%29.png" width=42 alt="MPV"> MPV](https://www.deb-multimedia.org/dists/testing/main/binary-amd64/package/mpv)
[Papirus Icons](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
[Roboto Fonts](https://packages.debian.org/fonts-roboto)

## Dotfiles
### .bashrc (Arch Linux like prompts with git support)
1. Install [Powerline fonts](https://github.com/powerline/fonts)
1. Install git-completion.bash and bash-git-prompt [Lucas .bashrc final Linux commit](https://github.com/ChevySSinSD/bashrc)
1. See .bashrc in this respository for config

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
