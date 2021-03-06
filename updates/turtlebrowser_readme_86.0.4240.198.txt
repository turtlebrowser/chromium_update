#!/bin/bash
set -e

# Based on branch: gitea/turtlebrowser_integration_chromium_86.0.4240.198_qt_5.15.2

#CUSTOM COMMITS git cherry-pick --strategy=recursive -X patience 1ebf9333bcbb2	 # psmaas@gmail.com	Mon Jan 18 09:51:55 2021 +0100	Fix DEPS
#CUSTOM COMMITS git cherry-pick --strategy=recursive -X patience f24cb0ae550a0	 # psmaas@gmail.com	Mon Jan 18 10:30:24 2021 +0100	Unignore modules
#CUSTOM COMMITS git cherry-pick --strategy=recursive -X patience 024b2135e5aa6	 # psmaas@gmail.com	Mon Jan 18 10:35:34 2021 +0100	Add all modules

# Squashed from 87 branch: Reinstate jumbo-builds
#git cherry-pick -Xsubtree=chromium --strategy=recursive -X patience 900e04947240c	 # allan.jensen@qt.io	Wed Dec 9 10:12:38 2020 +0100	Reinstate jumbo-builds
#git cherry-pick -Xsubtree=chromium --strategy=recursive -X patience 4d61735769d9b	 # allan.jensen@qt.io	Thu Mar 5 16:32:43 2020 +0100	Fixes for jumbo build
#git cherry-pick -Xsubtree=chromium --strategy=recursive -X patience 4c92778b74aef	 # allan.jensen@qt.io	Thu Dec 17 09:13:59 2020 +0100	FIXUP: Fixes for jumbo build

# --- CHROMIUM BUILDS

#git cherry-pick --strategy=recursive -X patience 925c1a4548745	 # jocelyn.turcotte@digia.com	Wed Jan 15 17:22:44 2014 +0100	Declare a Qt IPC message class
#git cherry-pick --strategy=recursive -X patience f04efe8e8043c	 # jocelyn.turcotte@digia.com	Mon Jul 28 15:01:41 2014 +0200	<chromium> Add a hook to provide our own icu data file path
#git cherry-pick --strategy=recursive -X patience f52a8695ba5c9	 # zeno.albisser@digia.com	Fri Nov 28 07:35:26 2014 -0800	<chromium> BrowserAccessibilityManager::Create is implemented in Qt sources.
#CONFLICT DROP git cherry-pick --strategy=recursive -X patience 63027a0ab87b9	 # andras.becsi@digia.com	Fri Oct 10 18:42:30 2014 +0200	<chromium> Add enable_error_page to web preferences
#git cherry-pick --strategy=recursive -X patience 61b938bb59b1214d02e150887e426d8dfce7cda3 # (87-based) andras.becsi@digia.com 2014-10-10 18:42:30 <chromium> Add enable_error_page to web preferences
#git cherry-pick --strategy=recursive -X patience 368bfc54a9944	 # andras.becsi@digia.com	Fri Oct 10 18:42:30 2014 +0200	Enable localization codepath on OS X and Linux
#git cherry-pick --strategy=recursive -X patience dad9cf2fc943b	 # andras.becsi@theqtcompany.com	Fri Aug 14 15:12:24 2015 +0200	Only define OPENSSLDIR if it is not already defined
#git cherry-pick --strategy=recursive -X patience 54d3907793404	 # joerg.bornemann@theqtcompany.com	Mon Mar 21 13:53:48 2016 +0100	Add CommandLine::CreateEmpty
#git cherry-pick --strategy=recursive -X patience 009dcf35cc9fe	 # allan.jensen@theqtcompany.com	Tue Jun 23 10:59:49 2015 +0200	Move querying EGL extensions out of chromium
#git cherry-pick --strategy=recursive -X patience ef17c525b14b3	 # jocelyn.turcotte@digia.com	Wed Nov 5 18:55:49 2014 +0100	Add POD TransferableFence
#git cherry-pick --strategy=recursive -X patience 2621bc77b8e80	 # allan.jensen@theqtcompany.com	Mon Jun 13 15:57:18 2016 +0200	Remove the Running without SUID sandbox error message
#git cherry-pick --strategy=recursive -X patience e5b4217d06ba6	 # pvarga@inf.u-szeged.hu	Tue May 24 17:25:41 2016 +0200	Disable ResourceBundle functions for enabling QtWebEngine implementation
#git cherry-pick --strategy=recursive -X patience 2a0c8a5e56d69	 # joerg.bornemann@qt.io	Wed Jun 22 17:01:46 2016 +0200	Do not call Ole(Un)Initialize
#git cherry-pick --strategy=recursive -X patience d895e81fcd865	 # alexandru.croitor@qt.io	Thu Oct 13 15:59:34 2016 +0200	Stop the flood of accessibility messages
#git cherry-pick --strategy=recursive -X patience 2c5a0ea4ab95c	 # allan.jensen@theqtcompany.com	Tue Sep 13 13:41:41 2016 +0200	Fix assert in Flash and incognito mode
#git cherry-pick --strategy=recursive -X patience fae9badb8bec7	 # allan.jensen@theqtcompany.com	Tue Jan 26 16:16:20 2016 +0100	Fix dependencies on ANGLE
#git cherry-pick --strategy=recursive -X patience 1212a0a84ff3b	 # michael.bruning@qt.io	Thu Dec 1 09:53:11 2016 +0100	Fix include order of texture_manager.h includes.
#git cherry-pick --strategy=recursive -X patience 32d945e46b574	 # michal.klocek@qt.io	Thu Nov 10 18:42:27 2016 +0100	Fix FORTIFY redefined warnings
#git cherry-pick --strategy=recursive -X patience 9b2bdf2d730cc	 # jocelyn.turcotte@digia.com	Mon Jul 28 15:01:22 2014 +0200	<chromium> Allow overriding GetXDisplay
#git cherry-pick --strategy=recursive -X patience c5dfc218776d9	 # allan.jensen@theqtcompany.com	Fri Oct 16 13:19:37 2015 +0200	Prevent a python IOError on Windows due to MAX_PATH
#git cherry-pick --strategy=recursive -X patience 0c22b025f2835	 # michael.bruning@qt.io	Mon Mar 20 12:10:23 2017 +0100	Windows: Fix file path too long problems in grit.py
#git cherry-pick --strategy=recursive -X patience a1ca197a70f03	 # allan.jensen@qt.io	Mon Apr 8 10:49:28 2019 +0200	Improve the issue with long file names on windows
#git cherry-pick --strategy=recursive -X patience 2af529b22b491	 # jocelyn.turcotte@digia.com	Wed Jun 17 15:30:50 2015 +0200	Expose a status callback for the DevToolsHttpHandler
#git cherry-pick --strategy=recursive -X patience 16ac41a3ce7e3	 # allan.jensen@qt.io	Wed Feb 8 10:56:34 2017 +0100	Do not force an unnecessary march flag
#git cherry-pick --strategy=recursive -X patience 186c3788967d2	 # allan.jensen@qt.io	Wed Mar 1 10:11:00 2017 +0100	Make incremental linking configurable
#git cherry-pick --strategy=recursive -X patience 754f8fd0ce0e1	 # allan.jensen@qt.io	Mon Mar 20 11:15:33 2017 +0100	Support external ozone platforms
#git cherry-pick --strategy=recursive -X patience 9c359e4569fa7	 # michal.klocek@qt.io	Tue Apr 25 16:57:38 2017 +0200	Fix not working video in debug builds
#git cherry-pick --strategy=recursive -X patience 1d3272b4b5ddd	 # alexandru.croitor@qt.io	Tue Apr 4 13:10:29 2017 +0200	Don't use the gesture detector for scrolls and flings on macOS
#git cherry-pick --strategy=recursive -X patience 2a077b345aeeb	 # michal.klocek@qt.io	Tue Jan 3 14:46:48 2017 +0100	Fix Linux kernel lacking V4L2_CID_POWER_LINE_FREQUENCY_AUTO
#git cherry-pick --strategy=recursive -X patience eb1b3301fc21b	 # allan.jensen@qt.io	Wed May 17 17:33:07 2017 +0200	Stop erronous deadlock errors in sandboxed debug mode
#git cherry-pick --strategy=recursive -X patience 54f6b0c38ea5e	 # pvarga@inf.u-szeged.hu	Wed Jun 7 10:37:04 2017 +0200	Suppress error message on unneeded V8 external startup files
#git cherry-pick --strategy=recursive -X patience 00954b1d82724	 # juri.valdmann@qt.io	Tue May 30 14:34:11 2017 +0200	Fix DCHECK with audio-only desktop capture
#git cherry-pick --strategy=recursive -X patience 19df0f51e8cf0	 # kai.koehne@qt.io	Wed May 18 16:35:21 2016 +0200	Adapt licenses.py for qdoc needs
#git cherry-pick --strategy=recursive -X patience 325f26bd604c9	 # allan.jensen@theqtcompany.com	Thu Jan 7 10:03:04 2016 +0100	Add API for accessing isolated contexts
#git cherry-pick --strategy=recursive -X patience 8b908c8b0b4bb	 # allan.jensen@digia.com	Fri Aug 22 10:58:53 2014 +0200	Fix medium hinting on Linux with fontconfig and freetype
#git cherry-pick --strategy=recursive -X patience 966e1641967cc	 # allan.jensen@digia.com	Fri Aug 22 10:58:53 2014 +0200	Fix webfonts with wrong hinting on Linux
#git cherry-pick --strategy=recursive -X patience 7362431226107	 # samuli.piippo@qt.io	Tue Mar 28 11:00:50 2017 +0300	Use target sysroot only with target toolchain
#git cherry-pick --strategy=recursive -X patience 3e5ef35940b85	 # allan.jensen@theqtcompany.com	Wed Jun 29 13:30:06 2016 +0200	Fix clang and embedded gcc builds
#git cherry-pick --strategy=recursive -X patience eb87f59620530	 # allan.jensen@qt.io	Tue Apr 11 15:31:09 2017 +0200	Do not force the use of Google's custom clang binaries
#git cherry-pick --strategy=recursive -X patience 309f232019fc7	 # allan.jensen@qt.io	Tue Mar 14 14:01:25 2017 +0100	Support linux-clang-libc++ builds
#git cherry-pick --strategy=recursive -X patience 0c6894528082d	 # michal.klocek@qt.io	Mon Jan 9 17:34:38 2017 +0100	Fix convert dict tool build
#git cherry-pick --strategy=recursive -X patience af15b5f58123d	 # allan.jensen@theqtcompany.com	Fri Apr 1 15:46:01 2016 +0200	Simplify naming of bdic dictionaries
#git cherry-pick --strategy=recursive -X patience a85e3d9b10544	 # allan.jensen@theqtcompany.com	Tue Sep 13 14:52:02 2016 +0200	Forward declare newer EGL typedefs
#git cherry-pick --strategy=recursive -X patience c9baea7434d48	 # michal.klocek@qt.io	Thu Dec 1 18:25:53 2016 +0100	Remove whitelist for script_exec from .gn
#git cherry-pick --strategy=recursive -X patience fdeda59fb72b0	 # michal.klocek@qt.io	Mon Mar 6 15:41:18 2017 +0100	Fix incorrect dependency on shim headers
#git cherry-pick --strategy=recursive -X patience 7d7a8d77468e7	 # allan.jensen@theqtcompany.com	Mon Aug 8 10:50:37 2016 +0200	Fixup select elements.
#git cherry-pick --strategy=recursive -X patience 72a6e12638b37	 # michal.klocek@qt.io	Wed Dec 7 17:37:23 2016 +0100	Qt GN integration
#git cherry-pick --strategy=recursive -X patience b6550a2ae0231	 # michal.klocek@qt.io	Sat Sep 12 17:22:04 2020 +0200	Add user script data mojo interface and traits
#git cherry-pick --strategy=recursive -X patience 01efcf73e24b3	 # allan.jensen@qt.io	Tue Sep 12 13:45:10 2017 +0200	Fix Chrome resources and WebUI we need
#git cherry-pick --strategy=recursive -X patience a1c9aaa3ab4dc	 # michal.klocek@qt.io	Mon Jun 25 19:56:11 2018 +0200	Add mojom for qtwebchannel interface
#git cherry-pick --strategy=recursive -X patience 01e8d81d1d916	 # allan.jensen@qt.io	Fri May 17 18:23:35 2019 +0200	Add mojom for renderer_configuration
#git cherry-pick --strategy=recursive -X patience f915259a14022	 # michael.bruning@qt.io	Tue Dec 5 14:45:04 2017 +0100	Add extensions to Qt build and fix it up for building
#git cherry-pick --strategy=recursive -X patience 395bb02e1e4a5	 # ztamas@inf.u-szeged.hu	Mon Feb 24 14:32:38 2020 +0100	Enable plugin.mojom for plugin placeholder
#git cherry-pick --strategy=recursive -X patience 315061ded0255	 # michal.klocek@qt.io	Mon Nov 2 14:31:08 2020 +0100	Add WebEnginePageRenderFrame mojo interface
#git cherry-pick --strategy=recursive -X patience 5fbf3fcc40dc0	 # psmaas@gmail.com	Sat Dec 26 22:24:56 2020 +0100	Add enable_webrtc property to make it build
#git cherry-pick --strategy=recursive -X patience 3bc0f2d95c0b9	 # allan.jensen@theqtcompany.com	Fri Jan 29 14:20:48 2016 +0100	Fix building without WebSpeech
#REPLACED ?? git cherry-pick --strategy=recursive -X patience 96c1935d2cc7c	 # allan.jensen@qt.io	Fri Feb 24 11:48:53 2017 +0100	Make XScrnSaver optional
#git cherry-pick --strategy=recursive -X patience f4dbd3a1e4931	 # allan.jensen@qt.io	Thu Jan 17 16:13:55 2019 +0100	Fix building on windows without toolkit_views
#git cherry-pick --strategy=recursive -X patience 6ccc28384223e	 # juri.valdmann@qt.io	Mon Mar 16 17:42:04 2020 +0100	Disable toolkit_views assert
#git cherry-pick --strategy=recursive -X patience ca0bd776a8c20	 # allan.jensen@qt.io	Tue Dec 5 15:08:40 2017 +0100	Fix override of malloc
#git cherry-pick --strategy=recursive -X patience 13f05dc3578c5	 # allan.jensen@qt.io	Thu Feb 15 17:57:59 2018 +0100	Avoid using libdrm
#git cherry-pick --strategy=recursive -X patience 1dafd738fd953	 # allan.jensen@qt.io	Mon Nov 23 13:55:14 2020 +0100	Reinstate the virtual accessibility Destroy()
#git cherry-pick --strategy=recursive -X patience c43fab3c5b7f2	 # psmaas@gmail.com	Wed Jan 6 11:04:04 2021 +0100	Compile fixes 84
#git cherry-pick --strategy=recursive -X patience 12121134cb2d2	 # jocelyn.turcotte@digia.com	Wed Nov 5 18:55:49 2014 +0100	Solve conflicts when including both QtOpenGL headers and resource_provider.h
#git cherry-pick --strategy=recursive -X patience 10d63c5ba69b3	 # juri.valdmann@qt.io	Tue May 28 11:00:10 2019 +0200	Use ui::Compositor (3rdparty)
#git cherry-pick --strategy=recursive -X patience 93eda2e557197	 # juri.valdmann@qt.io	Thu Dec 12 12:31:12 2019 +0100	Fix FlingScheduler in viz mode
#git cherry-pick --strategy=recursive -X patience 75b730428ebd5	 # allan.jensen@theqtcompany.com	Thu Aug 4 18:07:02 2016 +0200	Add accessors and seams for the Qt delegated renderer integration.
#git cherry-pick --strategy=recursive -X patience 24758f469a804	 # allan.jensen@qt.io	Wed Jul 15 11:56:19 2020 +0200	Make navigation on back/forward mouse buttons optional
#git cherry-pick --strategy=recursive -X patience 30327dcf27b31	 # michal.klocek@theqtcompany.com	Thu Apr 28 19:47:46 2016 +0200	Update handling of loading the dictionary
#git cherry-pick --strategy=recursive -X patience b68e5fc2cb17f	 # juri.valdmann@qt.io	Thu Apr 19 12:14:44 2018 +0200	Extend url library for WebEngine custom schemes
#git cherry-pick --strategy=recursive -X patience 95b30f90af476	 # juri.valdmann@qt.io	Tue Jan 23 10:36:52 2018 +0100	Adapt ProtocolHandlerRegistry for WebEngine
#git cherry-pick --strategy=recursive -X patience 5b96bed3bb072	 # michal.klocek@theqtcompany.com	Mon Sep 28 20:35:32 2015 +0200	Integrate spell checker sources, fix compilation issues
#git cherry-pick --strategy=recursive -X patience e54722f194c57	 # allan.jensen@qt.io	Wed May 3 13:53:19 2017 +0200	Fix build to have spellchecker compilation optional
#git cherry-pick --strategy=recursive -X patience 3214d1d651816	 # pvarga@inf.u-szeged.hu	Wed Oct 2 08:17:17 2019 +0200	Fix initialization of SpellCheckService on macOS
#git cherry-pick --strategy=recursive -X patience 24b5cd27120e5	 # allan.jensen@qt.io	Thu Sep 20 15:27:43 2018 +0200	Fix site_for_cookies for qrc resources
#git cherry-pick --strategy=recursive -X patience e8c2baf697540	 # allan.jensen@qt.io	Thu Oct 24 16:48:33 2019 +0200	Fix QRC cookies for tests with network-service
#git cherry-pick --strategy=recursive -X patience 3094a2e99b78b	 # allan.jensen@qt.io	Fri Jul 10 16:23:50 2020 +0200	Add cookie filter to URL requests cookie headers
#git cherry-pick --strategy=recursive -X patience b9d6bda358c33	 # allan.jensen@qt.io	Mon Nov 23 12:53:51 2020 +0100	Allow us to set cookie_manager like android_webview
#git cherry-pick --strategy=recursive -X patience aad18b5259e7a	 # davidsz@inf.u-szeged.hu	Tue Sep 10 17:32:04 2019 +0200	Support qrc protocol in UrlPattern
#git cherry-pick --strategy=recursive -X patience 310756234a845	 # allan.jensen@qt.io	Thu Jul 2 11:38:37 2020 +0200	Pass through a new application name argument to utility processes
#git cherry-pick --strategy=recursive -X patience bc1f58d2d9894	 # michal.klocek@qt.io	Wed Apr 29 09:06:01 2020 +0200	Fix initialize of cdm for sandbox from widevine-path
# WHERE IS THE USE OF THIS? "widevine-path";
#git cherry-pick --strategy=recursive -X patience 427d522dc9e6e	 # juri.valdmann@qt.io	Tue Aug 13 14:53:41 2019 +0200	Enable android-specific fields of RenderFrameMetadata
#git cherry-pick --strategy=recursive -X patience 975abe5edafd6	 # psmaas@gmail.com	Fri Jan 1 15:26:47 2021 +0100	If def the profile to make it easier to build without qt
#git cherry-pick --strategy=recursive -X patience e7253adcbe921	 # jocelyn.turcotte@digia.com	Tue Jun 11 15:44:26 2013 +0200	Add WebEngine classes as RunLoop/MessageLoop friends.
#git cherry-pick --strategy=recursive -X patience be1e3adb9b8ae	 # juri.valdmann@qt.io	Fri Jan 24 14:42:17 2020 +0100	Expose StoragePartitionImpl::InitNetworkContext
#git cherry-pick --strategy=recursive -X patience 43f76ade6bd71	 # allan.jensen@qt.io	Wed Feb 12 11:41:55 2020 +0100	Destroy old network context before creating the replacement
#git cherry-pick --strategy=recursive -X patience 08c308eea6f15	 # allan.jensen@qt.io	Wed Feb 12 11:40:24 2020 +0100	Allow changing user-agent without replace the entire network context
#git cherry-pick --strategy=recursive -X patience 164f77f0f9e39	 # allan.jensen@qt.io	Mon Aug 10 16:11:23 2020 +0200	Export SetBaseBackgroundColorOverride from WebView again
#git cherry-pick --strategy=recursive -X patience b283596e1ce9f	 # leander.beernaert@qt.io	Fri May 24 15:10:03 2019 +0200	Enable the option to remove previous user PrefService
#git cherry-pick --strategy=recursive -X patience 39501d014f27e	 # michal.klocek@qt.io	Mon Feb 19 12:54:27 2018 +0100	Switch to use glx over ozone
#git cherry-pick --strategy=recursive -X patience b70a3076599e9	 # allan.jensen@theqtcompany.com	Fri Oct 9 13:55:28 2015 +0200	Allow late fullscreen changed signal
#git cherry-pick --strategy=recursive -X patience 72cd6995a9d31	 # michal.klocek@qt.io	Mon Mar 12 15:38:02 2018 +0100	Fix freezes of glx context
#git cherry-pick --strategy=recursive -X patience 6edd25a0b0239	 # michal.klocek@qt.io	Tue Mar 24 15:21:28 2020 +0100	Fix viz crash when cleanup
#git cherry-pick --strategy=recursive -X patience 055b04929de3b	 # juri.valdmann@qt.io	Thu Nov 14 14:22:24 2019 +0100	Support GPU service on UI thread with viz
#git cherry-pick --strategy=recursive -X patience a7cba01ce1eca	 # juri.valdmann@qt.io	Fri Aug 21 12:20:22 2020 +0200	FIXUP: Support GPU service on UI thread with viz
#git cherry-pick --strategy=recursive -X patience bf1a29cf1bc93	 # juri.valdmann@qt.io	Fri Aug 10 12:59:13 2018 +0200	Support non-base::Thread GPU thread
#git cherry-pick --strategy=recursive -X patience cc8656b0a19a6	 # alexandru.croitor@qt.io	Mon Jul 31 11:10:26 2017 +0200	Don't use Chromium's OSExchangeDataProviderFactory::CreateProvider()
#git cherry-pick --strategy=recursive -X patience c91b2e012f128	 # allan.jensen@qt.io	Mon Aug 3 13:45:55 2020 +0200	Decouple payment from content
#git cherry-pick --strategy=recursive -X patience cf11715af546f	 # allan.jensen@qt.io	Tue Jul 21 16:52:22 2020 +0200	Fix build after 83-merge
#git cherry-pick --strategy=recursive -X patience d601de0b63210	 # juri.valdmann@qt.io	Mon Mar 16 20:07:30 2020 +0100	Disable font subsetting to support system harfbuzz < 2.4.0
#git cherry-pick --strategy=recursive -X patience 579a4bce7e691	 # allan.jensen@qt.io	Thu Feb 13 15:36:52 2020 +0100	Fix build for expanded sources
#git cherry-pick --strategy=recursive -X patience 55e58c1a0c34f	 # michael.bruning@theqtcompany.com	Fri Jan 15 11:26:31 2016 +0100	Fix printing sources for Qt and add them to the build.
#git cherry-pick --strategy=recursive -X patience b2e230bdb98fa	 # davidsz@inf.u-szeged.hu	Wed Oct 24 14:28:30 2018 +0200	Disable some DCHECKs to fix printing
#DROP CONFLICT git cherry-pick --strategy=recursive -X patience 8fb0608722719	 # davidsz@inf.u-szeged.hu	Tue Jul 10 16:54:17 2018 +0200	Enable high resolution printing
#git cherry-pick -Xsubtree=chromium --strategy=recursive -X patience ea65b11f3e143   # allan.jensen@qt.io   Fri Dec 11 09:45:04 2020 +0100  Enable high resolution printing
#git cherry-pick -Xsubtree=chromium --strategy=recursive -X patience 56bf040b58c1d   # allan.jensen@qt.io   Fri Dec 11 09:45:04 2020 +0100  FIXUP: Enable high resolution printing
#git cherry-pick --strategy=recursive -X patience ac31aa5e4c41f	 # allan.jensen@qt.io	Thu Oct 26 10:27:14 2017 +0200	Remove reference to safe_browsing constants
#git cherry-pick --strategy=recursive -X patience a2df04123557d	 # allan.jensen@qt.io	Wed Nov 22 16:28:21 2017 +0100	Do not bundle the tracing UI resources
#git cherry-pick --strategy=recursive -X patience 544f3cb032a8c	 # zeno.albisser@digia.com	Wed Apr 23 16:54:47 2014 +0200	<chromium> Do not directly override libc symbols from the library.
#git cherry-pick --strategy=recursive -X patience 6f1f50a34595b	 # allan.jensen@qt.io	Thu Dec 10 15:35:13 2020 +0100	FIXUP: Don't use the gesture detector for scrolls and flings on macOS
#git cherry-pick --strategy=recursive -X patience feb1547f6ba51	 # allan.jensen@qt.io	Mon Sep 2 13:53:59 2019 +0200	Fixups post 77-merge
#git cherry-pick --strategy=recursive -X patience b3f92cf2897a5	 # allan.jensen@qt.io	Fri Jan 24 16:26:45 2020 +0100	Fixes for post 79-merge

# --- CHROMIUM BUILDS --- QT BUILDS

#git cherry-pick --strategy=recursive -X patience 7a42fb6626876	 # allan.jensen@qt.io	Tue Feb 28 11:39:53 2017 +0100	Optionally unbundle libvpx, opus, FLAC, re2 and OpenH264
#git cherry-pick --strategy=recursive -X patience 77775910109d7	 # allan.jensen@qt.io	Wed Feb 8 13:55:03 2017 +0100	Unbundle Linux system libraries for GN

#git cherry-pick --strategy=recursive -X patience 53b0cd6d02694	 # michal.klocek@qt.io	Mon Sep 23 10:12:09 2019 +0200	Improve jpeg headers handling
#git cherry-pick --strategy=recursive -X patience 112ddcd28f455	 # allan.jensen@qt.io	Mon Mar 6 11:28:51 2017 +0100	Optionally link with system ffmpeg
#git cherry-pick --strategy=recursive -X patience 23cb51961d89a	 # viktor.engelmann@qt.io	Tue May 2 15:48:46 2017 +0200	Allow Service Workers without HTTP headers (again)
#git cherry-pick --strategy=recursive -X patience 14210583eec0c	 # alexandru.croitor@qt.io	Fri Jul 28 12:59:50 2017 +0200	Don't build Aura's gesture_nav_simple
#git cherry-pick --strategy=recursive -X patience 77187720f4afd	 # allan.jensen@qt.io	Mon Jul 17 13:40:47 2017 +0200	Do not build swiftshader when it is disabled
#git cherry-pick --strategy=recursive -X patience cc1c1f463c18f	 # allan.jensen@qt.io	Thu Aug 10 12:29:07 2017 +0200	Disable termination on out of memory.

#git cherry-pick --strategy=recursive -X patience 9d455c0a97f11	 # alexandru.croitor@qt.io	Wed May 17 16:53:20 2017 +0200	Add switch option for using OpenGL Core Profile in Chromium
#git cherry-pick --strategy=recursive -X patience e8d7f4e6d9c11	 # alexandru.croitor@qt.io	Wed Aug 30 15:11:42 2017 +0200	Windows: Fix incorrect relative path when linking .natvis files
#git cherry-pick --strategy=recursive -X patience 42c06b5650196	 # michal.klocek@qt.io	Thu Sep 7 12:05:08 2017 +0200	Fix headers for libpng in skia
#CONFLICT DROP git cherry-pick --strategy=recursive -X patience 5f0ed607018fa	 # alexandru.croitor@qt.io	Tue Aug 22 19:03:54 2017 +0200	Support using software GL implementation opengl32sw.dll on Windows

#git cherry-pick --strategy=recursive -X patience a902e9b828218	 # allan.jensen@qt.io	Fri Sep 15 15:42:49 2017 +0200	Do not assert on PPAPI resources we do not support.
#git cherry-pick --strategy=recursive -X patience 859f5bb0426be	 # allan.jensen@qt.io	Tue Nov 14 10:50:31 2017 +0100	Fix assert with devtools
#git cherry-pick --strategy=recursive -X patience 2741e2b4b8105	 # alexandru.croitor@qt.io	Mon Nov 20 10:42:27 2017 +0100	Use default MessageLoop type for NetworkConfigWatcherMac thread
#git cherry-pick --strategy=recursive -X patience 9d36dfd0fdf43	 # pvarga@inf.u-szeged.hu	Thu Jan 17 09:37:01 2019 +0100	Disable allocator check
#git cherry-pick --strategy=recursive -X patience 2ede36bbcc36c	 # alexandru.croitor@qt.io	Fri Dec 15 19:14:18 2017 +0100	Fix hanging of process when application is closed too fast
#git cherry-pick --strategy=recursive -X patience 0627455596c36	 # allan.jensen@qt.io	Mon Jan 22 13:14:41 2018 +0100	Make optimize_for_size an arg again
#git cherry-pick --strategy=recursive -X patience 198ed12dbff6e	 # zeno.albisser@theqtcompany.com	Fri Nov 28 17:53:02 2014 +0100	Leave a chance to all location providers to get a fix
#git cherry-pick --strategy=recursive -X patience ab2922d681d1f	 # pierre.rossi@digia.com	Mon May 13 16:25:46 2013 +0200	Disable location requests to the geolocation google API
#git cherry-pick --strategy=recursive -X patience 1367a6599557c	 # allan.jensen@qt.io	Wed Feb 7 14:41:08 2018 +0100	Fix render process crash for windows debug builds on win10
#git cherry-pick --strategy=recursive -X patience 2c166846d0c3f	 # allan.jensen@qt.io	Tue Feb 20 12:53:16 2018 +0100	Fix building on aarch64 without fp16
#git cherry-pick --strategy=recursive -X patience bbec6d4a65aa3	 # allan.jensen@qt.io	Mon Jun 26 13:17:39 2017 +0200	Do not launch zygote processes in single-process mode
#git cherry-pick --strategy=recursive -X patience 422116c042616	 # allan.jensen@qt.io	Tue Feb 27 14:41:08 2018 +0100	Pass original_request_url correctly (for view-source tests)
#git cherry-pick --strategy=recursive -X patience 8c7a80fee7acf	 # allan.jensen@qt.io	Tue Apr 17 16:24:21 2018 +0200	Pass virtual url of data url request back to the UI

#git cherry-pick --strategy=recursive -X patience 644a79a696289	 # alexandru.croitor@qt.io	Wed Feb 21 17:45:44 2018 +0100	Remove NOTREACHED in ScreenWin::GetNativeWindowFromHWND
#git cherry-pick --strategy=recursive -X patience 5ff5aa3e499eb	 # allan.jensen@qt.io	Mon May 27 15:17:52 2019 +0200	Allow non-Chrome projects to run

#git cherry-pick --strategy=recursive -X patience 17cbca00ea2a5	 # allan.jensen@qt.io	Fri Mar 22 16:21:57 2019 +0100	Allow shims in official builds
#git cherry-pick --strategy=recursive -X patience abf69dbf9f7e7	 # alexandru.croitor@qt.io	Fri Aug 4 15:18:10 2017 +0200	[Windows] Disable warnings about mf.dll
#git cherry-pick --strategy=recursive -X patience 9f4956842dfdf	 # allan.jensen@qt.io	Wed Feb 14 14:34:53 2018 +0100	[Revert] Hook up new rc.py.
#git cherry-pick --strategy=recursive -X patience 95e2ce421933b	 # viktor.engelmann@qt.io	Fri Aug 18 14:50:20 2017 +0200	Fix JPEG boolean values
#DROP FOR SIMPLER git cherry-pick --strategy=recursive -X patience 17861c6c29c6d	 # allan.jensen@qt.io	Tue Oct 10 15:11:42 2017 +0200	Fix Chromium built with X11 running without
#git cherry-pick -Xsubtree=chromium --strategy=recursive -X patience c6658bafaffbd7a1500b9c7f70f37d2025770c12 # Fix Chromium built with X11 running without

#git cherry-pick --strategy=recursive -X patience 60d280a18fe18	 # allan.jensen@qt.io	Fri Dec 16 10:55:58 2016 +0100	Don't generate Java bindings
#git cherry-pick --strategy=recursive -X patience ccfdf65ae7b94	 # pvarga@inf.u-szeged.hu	Thu Aug 10 11:37:05 2017 +0200	Fix Renderer and GPU threads on windows
#DROP CONFLICT ? git cherry-pick --strategy=recursive -X patience e22f257508eec	 # kai.koehne@qt.io	Thu Mar 15 11:16:06 2018 +0100	Win: Fix crashes when initializing GPU thread
#git cherry-pick --strategy=recursive -X patience 6388a48a21929	 # allan.jensen@qt.io	Fri Sep 21 11:38:36 2018 +0200	Do not assert on --disable-gpu
#git cherry-pick --strategy=recursive -X patience 9655edb943334	 # alexandru.croitor@qt.io	Mon Jul 16 18:47:07 2018 +0200	Fix --single-process --disable-gpu combination not to hit asserts
#git cherry-pick --strategy=recursive -X patience 0cf148a5c7510	 # alexandru.croitor@qt.io	Mon Jul 16 18:51:44 2018 +0200	Reduce severity level of messages when kDisableGpu switch is used
#git cherry-pick --strategy=recursive -X patience ef42305701f53	 # allan.jensen@qt.io	Thu Nov 14 17:38:02 2019 +0100	Fix url_utils for QtWebEngine
#git cherry-pick --strategy=recursive -X patience 893b5464badb6	 # allan.jensen@qt.io	Fri Feb 10 16:09:38 2017 +0100	Add remove_v8base_debug_symbols to GN

#git cherry-pick --strategy=recursive -X patience 01d6648224a90	 # allan.jensen@qt.io	Fri Jun 23 16:29:48 2017 +0200	Enable minimal optimizations when debug-symbols are disabled
#git cherry-pick --strategy=recursive -X patience 293dd2ee1651c	 # allan.jensen@qt.io	Thu Mar 8 16:34:33 2018 +0100	Also remove debug-symbols from the platform subdir of blink

#git cherry-pick --strategy=recursive -X patience 5e00e8c20f0c7	 # allan.jensen@qt.io	Mon Feb 6 11:13:24 2017 +0100	Reintroduce ninja_use_custom_environment_files
#git cherry-pick --strategy=recursive -X patience 556f22371313e	 # allan.jensen@qt.io	Thu May 17 16:00:33 2018 +0200	Use devtools app for Qt
#git cherry-pick --strategy=recursive -X patience ab61a42a19f95	 # michal.klocek@qt.io	Thu Jun 7 17:26:44 2018 +0200	Drop constexpr from constructors in pdfium StringView
#git cherry-pick --strategy=recursive -X patience f84945223381f	 # kirill.burtsev@qt.io	Mon Dec 9 16:23:58 2019 +0100	third_party perfetto: add missing include for clang, asan and no_pch
#git cherry-pick --strategy=recursive -X patience 215d06fbdd468	 # allan.jensen@qt.io	Sun Aug 12 14:26:22 2018 +0200	Bump maximum number of custom isolated world ids
#git cherry-pick --strategy=recursive -X patience f22c901712cd7	 # allan.jensen@qt.io	Fri Aug 31 17:56:12 2018 +0200	Fix code_generator.py for Windows paths
#git cherry-pick --strategy=recursive -X patience e7ef308e6dda8	 # allan.jensen@qt.io	Tue Sep 18 13:17:51 2018 +0200	Fix non-desktop Linux builds
#git cherry-pick --strategy=recursive -X patience 450d47e78af35	 # allan.jensen@qt.io	Sun Oct 21 18:42:44 2018 +0200	Fix crashes on exit
#DROP REPLACED git cherry-pick --strategy=recursive -X patience 5854c1d9173d1	 # allan.jensen@qt.io	Tue Oct 23 11:26:20 2018 +0200	Fix wake-lock with ozone
#git cherry-pick -Xsubtree=chromium --strategy=recursive -X patience 78043fa590aabb7b3d03503fcaac43d07f10df65 # Make XScrnSaver optional and work under ozone

#git cherry-pick --strategy=recursive -X patience 58539c12a150d	 # allan.jensen@qt.io	Sat Oct 27 11:30:28 2018 +0200	Make scroll animation less "drunk"
#git cherry-pick --strategy=recursive -X patience 9a3cada4abe26	 # alexandru.croitor@qt.io	Tue Nov 6 11:17:53 2018 +0100	Stop orphan child processes from staying alive on Windows
#git cherry-pick --strategy=recursive -X patience d3151d248e113	 # michal.klocek@qt.io	Fri Nov 9 09:49:18 2018 +0100	Do not make tools for webkit layout tests
#git cherry-pick --strategy=recursive -X patience 8fb94dfb3c2a1	 # alexandru.croitor@qt.io	Thu Jan 17 17:46:08 2019 +0100	Pass Qt Prefix path to the macOS V2 Seatbelt Sandbox
#git cherry-pick --strategy=recursive -X patience ba0c45d64852f	 # michal.klocek@qt.io	Wed Nov 14 10:57:31 2018 +0100	Minor. Drop dependency for ffmpeg for test_support
#git cherry-pick --strategy=recursive -X patience 5e7ca5c63ad87	 # pvarga@inf.u-szeged.hu	Wed Jan 30 15:17:57 2019 +0100	Make text selection handles available on macOS too
#git cherry-pick --strategy=recursive -X patience 9ded8970fc74e	 # michael.bruning@theqtcompany.com	Fri Oct 9 10:09:51 2015 +0200	Remove missing symlinks
#git cherry-pick --strategy=recursive -X patience f6ede0e9e9285	 # pvarga@inf.u-szeged.hu	Wed Mar 6 14:26:52 2019 +0100	Remove assert on exit

#git cherry-pick --strategy=recursive -X patience 7b33eba340904	 # allan.jensen@qt.io	Tue Jun 4 16:28:57 2019 +0200	Disable crash-reports when reporting is disabled

#BUILDS WITH QT

#git cherry-pick --strategy=recursive -X patience 1d80767d5563c	 # allan.jensen@qt.io	Thu Feb 7 17:33:53 2019 +0100	[Revert] Remove an MSVC-required macro.
#git cherry-pick --strategy=recursive -X patience 91b9c459e4c0c	 # allan.jensen@qt.io	Thu Aug 30 17:16:53 2018 +0200	[Revert] Remove base::internal::PassingTraits
#git cherry-pick --strategy=recursive -X patience e6da65a870f2a	 # juri.valdmann@qt.io	Mon Mar 16 16:31:24 2020 +0100	[Revert] Always strip absolute paths from debug symbols.
#git cherry-pick --strategy=recursive -X patience 2d952ed9c74ae	 # allan.jensen@qt.io	Mon Jun 24 14:58:15 2019 +0200	Fix zygote path used
#git cherry-pick --strategy=recursive -X patience fb24cb2e946a8	 # alexandru.croitor@qt.io	Fri Jul 12 17:21:33 2019 +0200	Protect against nullptr dereference in GetSelectedText
#git cherry-pick --strategy=recursive -X patience bc6b74480931b	 # michael.bruning@qt.io	Wed Jul 3 18:16:39 2019 +0200	Use dsymutil from the sdk instead of a bundled one
#git cherry-pick --strategy=recursive -X patience b7a11fec05e32	 # michal.klocek@qt.io	Thu Jun 20 09:09:53 2019 +0200	Fix segfaults with arm 32bit on metrics
#git cherry-pick --strategy=recursive -X patience 20bcedb8cc20e	 # michael.bruning@qt.io	Thu Feb 28 13:54:08 2019 +0100	Fix use of C++17 constexpr variadic templates
#git cherry-pick --strategy=recursive -X patience 5c126bafb4abc	 # allan.jensen@qt.io	Fri Aug 31 17:11:24 2018 +0200	Unbreak FFMPEG on windows
#git cherry-pick --strategy=recursive -X patience 78cf31f2eff88	 # allan.jensen@qt.io	Wed Feb 20 10:41:49 2019 +0100	Disable responsiveness watcher
#git cherry-pick --strategy=recursive -X patience 193023d159beb	 # michal.klocek@qt.io	Thu Feb 14 13:09:01 2019 +0100	Fix build with sanitizer and icecc
#git cherry-pick --strategy=recursive -X patience 63fd88358c725	 # allan.jensen@qt.io	Thu May 3 15:29:01 2018 +0200	Post 67-merge, 71-merge, 73-merge and 75-merge fixups
#git cherry-pick --strategy=recursive -X patience ac28e3198064e	 # allan.jensen@theqtcompany.com	Tue Jan 12 10:15:34 2016 +0100	Fix CDM on OSX and Windows with component installer

#git cherry-pick --strategy=recursive -X patience cd5813e0a4c79	 # michal.klocek@qt.io	Tue Feb 26 13:47:00 2019 +0100	Soften check for single thread only if layer1 or layer2 sandbox
#git cherry-pick --strategy=recursive -X patience e917a03e0c0f3	 # pvarga@inf.u-szeged.hu	Thu Apr 18 11:09:13 2019 +0200	Silence assert on MessageWindow::WindowClass destruction
#git cherry-pick --strategy=recursive -X patience d346b2c481783	 # michael.bruning@qt.io	Fri May 17 16:41:43 2019 +0200	Try different versions when creating a CoreProfile context on macOS
#git cherry-pick --strategy=recursive -X patience efb0d45434c84	 # allan.jensen@qt.io	Fri Jun 7 14:18:23 2019 +0200	Fix changing should_override_user_agent_in_new_tabs_
#git cherry-pick --strategy=recursive -X patience c2fa59f715fa4	 # michal.klocek@qt.io	Tue Jan 31 17:21:13 2017 +0100	Remove linking with libatomic
#git cherry-pick --strategy=recursive -X patience 994e59b4f614b	 # allan.jensen@qt.io	Tue Jun 4 15:12:15 2019 +0200	Support ubsan and asan on GCC
#git cherry-pick --strategy=recursive -X patience e1ae0c2f4d218	 # ztamas@inf.u-szeged.hu	Tue Jul 9 15:40:00 2019 +0200	Fix iterating when erasing last element from task queue
#git cherry-pick --strategy=recursive -X patience b7ab924783077	 # allan.jensen@qt.io	Tue Nov 12 13:53:29 2019 +0100	Fix is_main_frame in intercept_navigation_throttle
#git cherry-pick --strategy=recursive -X patience aa29b4641a858	 # allan.jensen@qt.io	Thu Jul 18 13:28:52 2019 +0200	Fix Windows sandbox for heterogeneous executables
#git cherry-pick --strategy=recursive -X patience a3a21f836e71c	 # michael.bruning@qt.io	Tue Apr 9 22:30:16 2019 +0200	Include root_layer_size in CompositorFrameMetadata again

#git cherry-pick --strategy=recursive -X patience 75b66f83ac9c5	 # michael.bruning@qt.io	Mon Feb 18 12:22:01 2019 +0100	Disable download and print buttons in PDF viewer
#git cherry-pick --strategy=recursive -X patience 5781ee73d6504	 # juri.valdmann@qt.io	Tue Sep 4 15:25:45 2018 +0200	Restore media::FFmpegGlue::InitializeFFmpeg()
#git cherry-pick --strategy=recursive -X patience da14137458cd4	 # allan.jensen@qt.io	Wed Feb 21 14:41:47 2018 +0100	Fix crossbuilds of v8 snapshots
#git cherry-pick --strategy=recursive -X patience 62b4fc038ecfd	 # allan.jensen@qt.io	Mon Sep 2 15:38:26 2019 +0200	Don't use harfbuzz-subset
#git cherry-pick --strategy=recursive -X patience d600d80313e93	 # davidsz@inf.u-szeged.hu	Fri Aug 30 18:01:06 2019 +0200	Fix pressure of tablet events
#git cherry-pick --strategy=recursive -X patience d69787de8f558	 # ztamas@inf.u-szeged.hu	Tue Oct 8 14:26:59 2019 +0200	Fix crash on exit on Windows
#git cherry-pick --strategy=recursive -X patience 4bb5659a49d7d	 # michael.bruning@qt.io	Mon Mar 26 17:51:48 2018 +0200	Convert asserts to logs and returns in the PpapiHost
#git cherry-pick --strategy=recursive -X patience 58cee78437b8a	 # juri.valdmann@qt.io	Thu Oct 17 12:26:27 2019 +0200	Disable long presentation time DCHECK
#git cherry-pick --strategy=recursive -X patience 2e3d901245099	 # allan.jensen@qt.io	Thu Oct 10 18:28:12 2019 +0200	Fixup rtc_use_x11
#git cherry-pick --strategy=recursive -X patience 9ab15b6e1c3d3	 # michael.bruning@qt.io	Tue Nov 12 18:25:30 2019 +0100	[macOS] Fix build error with new deployment target
#git cherry-pick --strategy=recursive -X patience 28716ec48b19d	 # juri.valdmann@qt.io	Fri Nov 15 15:31:11 2019 +0100	Fix pdfium build on macOS
#git cherry-pick --strategy=recursive -X patience 523ab1ba75481	 # michal.klocek@qt.io	Mon Jan 13 17:30:52 2020 +0100	Fix crash on page allocator
#DROP git cherry-pick --strategy=recursive -X patience 3fe8cbfb96b7f	 # michal.klocek@qt.io	Mon Jan 13 15:00:21 2020 +0100	Add fat build support

#DROP git cherry-pick --strategy=recursive -X patience ace7c98cfb841	 # allan.jensen@qt.io	Mon Jan 27 15:37:36 2020 +0100	Fix protozero generated sources
#git cherry-pick --strategy=recursive -X patience c3f7f53167299	 # allan.jensen@qt.io	Mon Feb 10 10:40:26 2020 +0100	Suppress assert
#git cherry-pick --strategy=recursive -X patience 0a04b9cf029cc	 # allan.jensen@qt.io	Thu Mar 19 13:25:28 2020 +0100	Fix build with MSVC standard library
#git cherry-pick --strategy=recursive -X patience 2399ccbbcf36f	 # pvarga@inf.u-szeged.hu	Thu Feb 13 08:27:27 2020 +0100	Suppress DCHECK triggered by NGInlineNode::ComputeMinMaxSize
#git cherry-pick --strategy=recursive -X patience 339a13668d1b2	 # allan.jensen@qt.io	Thu Aug 22 13:15:07 2019 +0200	Restore -fno-delete-null-pointer-checks
#git cherry-pick --strategy=recursive -X patience be0ee1b09359b	 # allan.jensen@qt.io	Tue Jan 28 14:22:30 2020 +0100	Suppress racy DCHECK
#git cherry-pick --strategy=recursive -X patience 62548fdf6886c	 # juri.valdmann@qt.io	Mon Mar 16 19:39:45 2020 +0100	Allow disabling SurfaceLayer for videos on non-Android platforms
#git cherry-pick --strategy=recursive -X patience 3f4071f20c8e5	 # juri.valdmann@qt.io	Thu Mar 26 12:17:18 2020 +0100	Invalidate cached selection bounds on scrolling
#git cherry-pick --strategy=recursive -X patience f806650e9348c	 # juri.valdmann@qt.io	Mon Mar 16 14:35:21 2020 +0100	Fix build after 80-merge

#git cherry-pick --strategy=recursive -X patience d988c5c2bef44	 # pvarga@inf.u-szeged.hu	Thu Mar 26 16:42:11 2020 +0100	Guard third-party heap in V8
#git cherry-pick --strategy=recursive -X patience ab788f139d361	 # allan.jensen@qt.io	Thu Apr 2 15:34:21 2020 +0200	Fix build with PDF disabled
#git cherry-pick --strategy=recursive -X patience 4eed5caa79ffa	 # juri.valdmann@qt.io	Sat Apr 4 06:17:54 2020 +0200	Stop sending ViewMsg_SetBackgroundOpaque to renderer
#git cherry-pick --strategy=recursive -X patience 8f8d73d5a0ecc	 # ztamas@inf.u-szeged.hu	Mon Sep 30 10:51:14 2019 +0200	Fix skia crash on Windows after 77-merge
#git cherry-pick --strategy=recursive -X patience c00c20fcc03e3	 # allan.jensen@qt.io	Mon Mar 9 15:33:33 2020 +0100	Fix ozone builds of ANGLE

#git cherry-pick --strategy=recursive -X patience 8112824a20e06	 # allan.jensen@qt.io	Tue Apr 21 11:52:48 2020 +0200	Fix crash in file-selector tests
#git cherry-pick --strategy=recursive -X patience f446821411568	 # pvarga@inf.u-szeged.hu	Tue Apr 21 16:57:13 2020 +0200	Disable alternate window station of Windows sandbox
#git cherry-pick --strategy=recursive -X patience c4572301035ae	 # juri.valdmann@qt.io	Wed Feb 19 14:15:34 2020 +0100	Fix recursive deadlock in sandbox::InitLibcLocaltimeFunctions
#git cherry-pick --strategy=recursive -X patience 1099c4c442c57	 # allan.jensen@qt.io	Thu Apr 23 10:20:27 2020 +0200	Speculative fix for xkbcommon include

#git cherry-pick --strategy=recursive -X patience 04588681d42de	 # pvarga@inf.u-szeged.hu	Thu Jun 4 13:06:44 2020 +0200	Enable NativeThemeAura on macOS too
#DROP NEW ON 87 git cherry-pick --strategy=recursive -X patience 9bccf2bdab529	 # allan.jensen@qt.io	Thu Apr 30 11:17:51 2020 +0200	Build devtools modules with system nodejs
#FIXUP on 87
#git cherry-pick -Xsubtree=chromium --strategy=recursive -X patience e3260e1724228faeee234e2fdaee535445e99629 # Make builds with node.js 8.10 possible
#git cherry-pick -Xsubtree=chromium --strategy=recursive -X patience 0b8575f3968c9395d6eb7bdbfa89cc440df6e7d2 # FIXUP: Build devtools modules with system nodejs

# QT BUILDS

#git cherry-pick --strategy=recursive -X patience 5b2505009b873	 # michal.klocek@qt.io	Thu Jun 25 14:36:16 2020 +0200	Add missing include in certificate net log
#git cherry-pick --strategy=recursive -X patience 1c9928aec7c87	 # allan.jensen@qt.io	Fri Jun 26 13:17:40 2020 +0200	Fix libjpeg_turbo for ARM32

#git cherry-pick --strategy=recursive -X patience 9682250d0fbb4	 # michal.klocek@qt.io	Wed Jul 1 13:37:17 2020 +0200	Fix angle_platform_impl after 80 rebase
#git cherry-pick --strategy=recursive -X patience 2f0167074af22	 # allan.jensen@qt.io	Thu Aug 6 11:43:22 2020 +0200	Fix debug-info in MSVC developer-builds

#git cherry-pick --strategy=recursive -X patience 41ed29b6c099f	 # allan.jensen@qt.io	Thu Aug 6 11:38:04 2020 +0200	Make compile time switch at compile time
#git cherry-pick --strategy=recursive -X patience 35f010a8bf7a0	 # allan.jensen@qt.io	Mon Aug 3 15:30:28 2020 +0200	[Revert] Update base/ for 10.15 SDK requirement
#git cherry-pick --strategy=recursive -X patience f04acc58f3741	 # allan.jensen@qt.io	Thu Aug 6 10:13:34 2020 +0200	Fix crashes with MSVC post 83 merge
#git cherry-pick --strategy=recursive -X patience 8010e447dedf5	 # allan.jensen@qt.io	Wed Aug 19 11:06:05 2020 +0200	Fix non-desktop linux builds
#git cherry-pick --strategy=recursive -X patience bcb0eda6007d4	 # allan.jensen@qt.io	Mon Aug 3 12:50:06 2020 +0200	Fix debug builds
#git cherry-pick --strategy=recursive -X patience aa0646cfcb298	 # allan.jensen@qt.io	Tue Aug 18 13:34:53 2020 +0200	Remove blocking of proper fixes
#git cherry-pick --strategy=recursive -X patience 3b33cad094ebb	 # pvarga@inf.u-szeged.hu	Fri Aug 28 14:06:37 2020 +0200	Disable NetworkServiceSandbox on macOS by default
#DROP IOS git cherry-pick --strategy=recursive -X patience 39addcb253949	 # michal.klocek@qt.io	Fri Jan 10 16:36:49 2020 +0100	Fix ios build issues for 83 adaptations

#git cherry-pick --strategy=recursive -X patience 07187e8ffe370	 # allan.jensen@qt.io	Mon Aug 31 16:28:09 2020 +0200	[Revert] Pass -D to libtool instead of setting ZERO_AR_DATE.
#git cherry-pick --strategy=recursive -X patience d832f62341ffa	 # allan.jensen@qt.io	Wed Aug 19 11:50:33 2020 +0200	Avoid conflict between vulkan.h definitions
#git cherry-pick --strategy=recursive -X patience 5afe6401d1fc2	 # allan.jensen@qt.io	Tue Aug 4 15:55:56 2020 +0200	Fixups post 83-merge for Windows

#git cherry-pick --strategy=recursive -X patience 5ffb53d36cd31	 # pvarga@inf.u-szeged.hu	Wed Sep 2 09:15:16 2020 +0200	Do not request BadgeService interface
#git cherry-pick --strategy=recursive -X patience 051f081dd052a	 # allan.jensen@qt.io	Tue Sep 1 09:48:32 2020 +0200	[Revert] Update various bits of Chromium to require the 10.15 SDK.
#git cherry-pick --strategy=recursive -X patience 3b1eee1af484c	 # allan.jensen@qt.io	Wed Sep 9 12:19:59 2020 +0200	Allow --disable-gpu to disable gpu thread/process
#git cherry-pick --strategy=recursive -X patience e99c19e8b8ef7	 # psmaas@gmail.com	Wed Jan 6 10:49:46 2021 +0100	Add xcb dependencies
#git cherry-pick --strategy=recursive -X patience ee18f7d072d13	 # psmaas@gmail.com	Sun Jan 17 02:52:21 2021 +0100	Don't ignore gclient_args.gni
# Add the generated gclient_args.gni
#git cherry-pick --strategy=recursive -X patience 6ae88453d2bbb	 # psmaas@gmail.com	Tue Jan 19 18:17:22 2021 +0100	Add the generated gclient_args.gni
#git cherry-pick --strategy=recursive -X patience 56afe6efb9219	 # allan.jensen@qt.io	Wed Feb 7 13:19:52 2018 +0100	Add gclient_args.gni file that should have been generated by gclient
#git cherry-pick --strategy=recursive -X patience b21ec511c48e8	 # allan.jensen@qt.io	Tue Dec 8 16:55:02 2020 +0100	FIXUP: Add gclient_args.gni file that should have been generated by gclient
#git cherry-pick --strategy=recursive -X patience 3e25c73e7ead2	 # psmaas@gmail.com	Sun Jan 17 02:54:05 2021 +0100	Compilefixes for 85
#DROP (Included in JUMBO) git cherry-pick --strategy=recursive -X patience 2c7a6e0a94dae	 # allan.jensen@qt.io	Wed Dec 9 10:12:38 2020 +0100	Reinstate jumbo-builds
#git cherry-pick --strategy=recursive -X patience a78c3254c12db	 # allan.jensen@qt.io	Sun Jan 3 20:39:20 2021 +0100	Fix embedded builds with printing enabled
#DROP (Included in JUMBO) git cherry-pick --strategy=recursive -X patience e54e61762cf13	 # psmaas@gmail.com	Wed Jan 20 21:08:25 2021 +0100	Fix namespace + include guard error in V8
#DROP INTEGRATED git cherry-pick --strategy=recursive -X patience f8170ad985225	 # psmaas@gmail.com	Thu Jan 21 12:06:21 2021 +0100	Fix for code that needs C++17
