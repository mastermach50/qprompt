# qprompt
A simply GUI app to prompt the user for some input, like passwords.
qprompt is built using [iced-rs](https://github.com/iced-rs/iced/) an hence supports wayland.
The text given by the user is simply printed to stdout so that this can be used in scripts.

### For example
```
qprompt | sudo -S wireshark
```
When this command is run using some app launcher the user can give the password without needing an open terminal.

# Screenshot
![screenshot](screenshot.png)

# TODO
|Feature|Status|
|---|---|
|Secure input|✅|
|Enter is submit|✅|
|Program icon||
|Automatically focus on input field|✅|
|More config options||
