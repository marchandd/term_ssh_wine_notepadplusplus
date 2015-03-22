# marchandd/term_ssh_wine_notepadplusplus

[marchandd/term_ssh_wine_notepadplusplus](https://registry.hub.docker.com/u/marchandd/term_ssh_wine_notepadplusplus/ "MarchandD")  [Docker:copyright:](https://docs.docker.com/ "Docker") image

## Description

A sandbox container with wine 1.7 ready for settings and some Windows Portable-apps samples easy to install, update and use from Linux or Windows host.
In this case, Graphical user interface portable software presents are:
- Notepad++ by Notepad++Team to edit source code supporting several languages.

### Goal

Based from term_ssh_root_wine image:  
Easy method to produce a GUI containers to access to Wine and able to download apps with Firefox into sandbox from secured host to remote client with SSH.
Image can run Windows software through emulator accessing by view remotely X displays.

After image and container builds, connect to container with GUI SSH client.  
Run scripts for Windows Portable-apps samples to install and use like explain in [docs](https://github.com/marchandd/term_ssh_wine_notepadplusplus/blob/master/docs/summary.md "Summary").

### Softwares tested

| State | Portable-app  
| --- | ---  
| Gold | [Notepad++](https://github.com/marchandd/term_ssh_wine_notepadplusplus/blob/master/docs/notepad.md "Notepad++_Details") Portable-app  

### Image size

Around 1250 Mb.

### References

[Marchand D. Maintainer](https://github.com/marchandd/ "Maintainer")

[Details source](https://github.com/marchandd/term_ssh_wine_notepadplusplus/ "Details")

[Image parent](https://github.com/marchandd/term_ssh_root_wine/ "Parent")

[Part of project studies](https://github.com/marchandd/docker_index/ "References")

## Build image

### Command line

:computer: `docker pull marchandd/term_ssh_wine_notepadplusplus`

### Firewall

:warning: If your Firewall is enabled on the host, with default outgoing policy turned to 
deny, 
you will have to disable 22 port filtering:  
- Make a new rule for OpenSSH (22/TCP) to enable outgoing policy.

## Build container

### Command line

:computer: `docker run -d -p XXX.XXX.XXX.XXX:YYYYY:22 -v LOCALPATH:/data marchandd/term_ssh_wine_notepadplusplus`

### Command line explanation

All details on [docs](https://github.com/marchandd/term_ssh_wine_notepadplusplus/blob/master/docs/summary.md "Summary").

## Container usage

### SSH access

Open terminal with root/administrator account.  
Basic fixed password for Docker public repository from marchandd/term_ssh_root_wine image = 'term_ssh_root_wine'

:computer: `ssh -X root@XXX.XXX.XXX.XXX -p YYYYY`

### Alias

All details on [docs](https://github.com/marchandd/term_ssh_wine_notepadplusplus/blob/master/docs/summary.md "Summary").

## Explanations

### Dockerfile

All details on [docs](https://github.com/marchandd/term_ssh_wine_notepadplusplus/blob/master/docs/summary.md "Summary").

### Display

Make sure to have installed OpenSSH client or GUI SSH client (Putty).
Wine is installed but need to be initialized before using it.  
:star2: Very easy way that take less than 5 minutes, you just have to run only 3 times one same command in cyclic mode to run sub programs and just 1 command line to active alias !

All details on [docs](https://github.com/marchandd/term_ssh_wine_notepadplusplus/blob/master/docs/summary.md "Summary").

### Risks

Root account from container is exposed.  
A password is used and not a certificate that could be more secure.
