# Chocolatey Package: Bria

![Build Status](https://github.com/open-circle-ltd/chocolatey.bria/actions/workflows/chocomilk.yml/badge.svg)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=popout-square)](licence)

## Description

Thoughtfully designed, Bria 5 is a dynamic, next generation softphone application that enables you to manage your communications easily and efficiently – all from your desktop computer. Bria can replace or complement your desk phone, allowing you to make voice and video calls over IP, see when contacts are available, send messages and transfer files. Bria for desktop can further be enhanced with custom branding and feature options for large-scale (200+ seat) deployments.

Boost productivity with Microsoft® Office integration on Bria for Windows, allowing you to make voice and video see if your contacts are available and send messages all within Outlook.
1080p HD video calling using H.264 and VP8 codecs for crisper and clearer images.
New to 5.4: Support for macOS 10.14 (Mojave).
Call History interface and feature enhancements to help streamline and promote efficiencies.
Calls are now grouped by name and caller ID. Groups are collapsed by default, and can be expanded to view more detailed call history information.
Manage call recordings directly from History - see which calls have recordings, play and delete recordings as well.
Additional filtering categories - not only can you filter for missed calls, you can now find calls with recordings, and filter by date. If you have more than one SIP account, you can filter based on the SIP account used to place a call.
Export call history to a .csv file for for potential reporting purposes.
Built on SIP and open standards, Bria has proven interoperability with many of the industry's standard platforms and devices, including Asterisk, Cisco, It also includes features specifically designed for business and enterprise users, and can be deployed within an enterprise environment either by manual configuration or by using the Provisioning Module of CounterPath's Stretto Platform™.

## Package Parameters

- `/RemoveDesktopIcons` Removes the desktop icon from Airtame.
- `/CleanStartmenu` Removes frequently used airtame shortcuts from the Startmenu.

## Installation

installation without parameters.

```ps1
 choco install bria
```

installation with parameters.

```ps1
 choco install bria --params="'/RemoveDesktopIcons /CleanStartmenu'"
```

## Disclaimer

These Chocolatey Packages only contain installation routines. The software itself is downloaded from the official sources of the software developer. ITIGO AG has no affilation with the software developer.

## Author

- [Simon Bärlocher](https://sbaerlocher.ch)
- [ITIGO AG](https://www.itigo.ch)

## License

This project is under the MIT License. See the [LICENSE](LICENSE) file for the full license text.

## Copyright

(c) 2019, ITIGO AG
