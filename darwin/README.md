## how i installed nix darwin

```
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --prefer-upstream-nix

```



### errors:
```
 ~ . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh                                                                 v20.18.3
/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh (line 6): Unsupported use of '='. In fish, please use 'set NIX_LINK $HOME/.nix-profile'.
NIX_LINK=$HOME/.nix-profile
^~~~~~~~~~~~~~~~~~~~~~~~~~^
from sourcing file /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
.: Error while reading file '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
➜  ~ set NIX_LINK $HOME/.nix-profile                                                                                             v20.18.3
➜  ~ . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh                                                                 v20.18.3
/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh (line 6): Unsupported use of '='. In fish, please use 'set NIX_LINK $HOME/.nix-profile'.
NIX_LINK=$HOME/.nix-profile
^~~~~~~~~~~~~~~~~~~~~~~~~~^
from sourcing file /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
.: Error while reading file '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'

```


https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#getting-started

Needed to manually add nixpkgs channel 

``
➜  ~ sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable                                                          v20.18.3
``



installing on my t2 macbook pro:
```
export NIX_INSTALLER_USE_LEGACY_INTEL_MAC_VERSION=1 
curl -sSf -L https://install.lix.systems/lix | sh -s -- install
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh  
sudo nix-channel --add https://github.com/nix-darwin/nix-darwin/archive/nix-darwin-25.11.tar.gz darwin
sudo nix-channel --add https://nixos.org/channels/nixpkgs-25.11-darwin nixpkgs
sudo nix-channel --update                                                     
nix-build '<darwin>' -A darwin-rebuild        

# home-manager
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
sudo nix-channel --update                                                     

