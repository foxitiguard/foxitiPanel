
<h2 align="center">Lightweight and powerful control panel for the modern web<br> MADE IN BANGLADESH</br> </h2>

<p align="center"><strong>Latest stable release:</strong> Version 1.10.5 |

</a>
		

## **Welcome!**

Foxiti Control Panel is designed to provide administrators an easy to use web and command line interface, enabling them to quickly deploy and manage web domains, mail accounts, DNS zones, and databases from one central dashboard without the hassle of manually deploying and configuring individual components or services.

## Donate

<br />
Bitcoin : 0x7bba031cdf9d65f1ddfa2f8f3687707ba0669592<br>
Ethereum : 0x7bba031cdf9d65f1ddfa2f8f3687707ba0669592<br>
Binance: 0x7bba031cdf9d65f1ddfa2f8f3687707ba0669592


## Features and Services

- Apache2 and NGINX with PHP-FPM
- Multiple PHP versions (5.6 - 8.5, 8.5 as default)
- DNS Server (Bind) with clustering capabilities
- POP/IMAP/SMTP mail services with Anti-Virus, Anti-Spam, and Webmail (ClamAV, SpamAssassin, Sieve, Roundcube)
- MariaDB/MySQL and/or PostgreSQL databases
- Let's Encrypt SSL support with wildcard certificates
- Firewall with brute-force attack detection and IP lists (iptables, fail2ban, and ipHe

## Supported platforms and operating systems

- **Debian:** 13, 12, 11
- **Ubuntu:** 26.04 LTS, 24.04 LTS, 22.04 LTS

**NOTES:**

- Foxiti Control Panel does not support 32 bit operating systems!
- Foxiti Control Panel in combination with OpenVZ 7 or lower might have issues with DNS and/or firewall. If you use a Virtual Private Server we strongly advice you to use something based on KVM or LXC!

## Installing Foxiti Control Panel

- **NOTE:** You must install Foxiti Control Panel on top of a fresh operating system installation to ensure proper functionality.

While we have taken every effort to make the installation process and the control panel interface as friendly as possible (even for new users), it is assumed that you will have some prior knowledge and understanding in the basics how to set up a Linux server before continuing.

### Step 1: Log in

To start the installation, you will need to be logged in as **root** or a user with super-user privileges. You can perform the installation either directly from the command line console or remotely via SSH:

```bash
ssh root@your.server
```

### Step 2: Download

Download the installation script for the latest release:

```bash
wget https://cp.foxitiguard.com/foxiti/foxitipanel/release/install/fxt-install.sh
```

If the download fails due to an SSL validation error, please be sure you've installed the ca-certificate package on your system - you can do this with the following command:

```bash
apt-get update && apt-get install ca-certificates
```

### Step 3: Run

To begin the installation process, simply run the script and follow the on-screen prompts:

```bash
bash fxt-install.sh
```

You will receive a welcome email at the address specified during installation (if applicable) and on-screen instructions after the installation is completed to log in and access your server.

### Custom installation

You may specify a number of various flags during installation to only install the features in which you need. To view a list of available options, run:

```bash
bash hst-install.sh -h
```

Alternatively, You can use <https://cp.foxitiguard.com/install.html> which allows you to easily generate the installation command via GUI.

## How to upgrade an existing installation

Automatic Updates are enabled by default on new installations of Hestia Control Panel and can be managed from **Server Settings > Updates**. To manually check for and install available updates, use the apt package manager:

```bash
apt-get update
apt-get upgrade
```

## Issues & Support Requests

- If you encounter a general problem while using Hestia Control Panel and need help, please [visit our forum](https://cp.foxitiguard.com/forum) to search for potential solutions or post a new thread where community members can assist.
- Bugs and other reproducible issues should be filed via GitHub by [creating a new issue report](https://github.com/foxitiguard/foxitiPanel/issues) so that our developers can investigate further. Please note that requests for support will be redirected to our forum.

**IMPORTANT: We _cannot_ provide support for requests that do not describe the troubleshooting steps that have already been performed, or for third-party applications not related to Foxiti Control Panel (such as WordPress). Please make sure that you include as much information as possible in your forum posts or issue reports!**


##Copyright & Proprietary Rights

FOXITI Control Panel and FoxitiPanel are products developed and maintained by Foxitiguard Technologies Bangladesh.

Copyright in original code, original designs, documentation, branding, and other original contributions created by Foxitiguard Technologies Bangladesh belongs to the company, except where otherwise stated or where third-party rights apply.

The FOXITI name, FoxitiPanel name, and Foxitiguard logo are proprietary brand identifiers of Foxitiguard Technologies Bangladesh. No trademark or branding rights are granted by this notice except as expressly authorized.

Third-party software, upstream-derived code, and contributions remain subject to their applicable licenses and copyright notices.

Third-Party Software & Licensing

This project originated from code derived from Hestia Control Panel, which is based on Vesta Control Panel. Portions of the project may remain subject to the GNU General Public License v3.0 (GPL-3.0), as applicable to the relevant code.

This notice does not revoke, replace, or restrict rights granted by applicable third-party licenses. The licensing status of independently developed components and any future clean-room implementation should be documented separately.
