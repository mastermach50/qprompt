# qprompt
A simply GUI app to prompt the user for some input, like passwords.
qprompt is built using [iced-rs](https://github.com/iced-rs/iced/) an hence supports wayland.
The text given by the user is simply printed to stdout so that this can be used in scripts.

### Examples
```
qprompt | sudo -S wireshark
```
When this command is run using some app launcher the user can input the password without needing an open terminal.

or

qprompt can be set as the default askpass program used by sudo using the `SUDO_ASKPASS` environment variable. Then the following command will use qprompt to prompt the password
```
sudo -A gparted
```
# Screenshot
![screenshot](screenshot.png)

# Building
## Without nix
Install rust and run `cargo b --release`
## With nix
```
nix-build
```
# TODO
|Feature|Status|
|---|---|
|Secure input|✅|
|Enter is submit|✅|
|Automatically focus on input field|✅|
|Program icon||
|More config options||
