#!/bin/bash
set -e

# Based on branch: old/turtlebrowser_integration_chromium_88.0.4324.182_qt_5.15.2_prep_for_89

#git cherry-pick --strategy=recursive -X patience 2ef28d5c2e304	 # psmaas@gmail.com	Wed Feb 24 14:59:32 2021 +0100	Fix DEPS
#git cherry-pick --strategy=recursive -X patience fee25bc455bf9	 # psmaas@gmail.com	Wed Feb 24 15:11:23 2021 +0100	Add generated files
#git cherry-pick --strategy=recursive -X patience 463d8e6b2d415	 # psmaas@gmail.com	Wed Feb 24 15:11:52 2021 +0100	Unignore modules
#git cherry-pick --strategy=recursive -X patience 098d9d1fb72d8	 # psmaas@gmail.com	Wed Feb 24 15:12:26 2021 +0100	Add all modules
#git cherry-pick --strategy=recursive -X patience fd84299e085f4	 # allan.jensen@qt.io	Wed Dec 9 10:12:38 2020 +0100	Reinstate jumbo-builds
#git cherry-pick --strategy=recursive -X patience 63c07cc3d7a5d	 # psmaas@gmail.com	Fri Jan 22 11:46:46 2021 +0100	Remove no_check_targets

#git cherry-pick --strategy=recursive -X patience 0dbe3a24a6736	 # jocelyn.turcotte@digia.com	Wed Jan 15 17:22:44 2014 +0100	Declare a Qt IPC message class
#git cherry-pick --strategy=recursive -X patience ebc4d828391c5	 # jocelyn.turcotte@digia.com	Mon Jul 28 15:01:41 2014 +0200	<chromium> Add a hook to provide our own icu data file path
#git cherry-pick --strategy=recursive -X patience 92d165873519b	 # zeno.albisser@digia.com	Fri Nov 28 07:35:26 2014 -0800	<chromium> BrowserAccessibilityManager::Create is implemented in Qt sources.

#git cherry-pick --strategy=recursive -X patience 08651a0b47d52	 # andras.becsi@digia.com	Fri Oct 10 18:42:30 2014 +0200	<chromium> Add enable_error_page to web preferences
#git cherry-pick --strategy=recursive -X patience a1256cd9fee05	 # andras.becsi@digia.com	Fri Oct 10 18:42:30 2014 +0200	Enable localization codepath on OS X and Linux

#git cherry-pick --strategy=recursive -X patience 1d6cd5152255f	 # andras.becsi@theqtcompany.com	Fri Aug 14 15:12:24 2015 +0200	Only define OPENSSLDIR if it is not already defined
#git cherry-pick --strategy=recursive -X patience b26107d2a7ed0	 # joerg.bornemann@theqtcompany.com	Mon Mar 21 13:53:48 2016 +0100	Add CommandLine::CreateEmpty
#git cherry-pick --strategy=recursive -X patience 2bba5fa0e92b2	 # allan.jensen@theqtcompany.com	Tue Jun 23 10:59:49 2015 +0200	Move querying EGL extensions out of chromium
#git cherry-pick --strategy=recursive -X patience a3c811a32ee2c	 # jocelyn.turcotte@digia.com	Wed Nov 5 18:55:49 2014 +0100	Add POD TransferableFence
#git cherry-pick --strategy=recursive -X patience 201633628ed40	 # allan.jensen@theqtcompany.com	Mon Jun 13 15:57:18 2016 +0200	Remove the Running without SUID sandbox error message
#git cherry-pick --strategy=recursive -X patience 55d7074d2a568	 # pvarga@inf.u-szeged.hu	Tue May 24 17:25:41 2016 +0200	Disable ResourceBundle functions for enabling QtWebEngine implementation
#git cherry-pick --strategy=recursive -X patience 7f08947e50843	 # joerg.bornemann@qt.io	Wed Jun 22 17:01:46 2016 +0200	Do not call Ole(Un)Initialize
#git cherry-pick --strategy=recursive -X patience 760d27d7d8642	 # alexandru.croitor@qt.io	Thu Oct 13 15:59:34 2016 +0200	Stop the flood of accessibility messages
#git cherry-pick --strategy=recursive -X patience dff88640cf739	 # allan.jensen@theqtcompany.com	Tue Jan 26 16:16:20 2016 +0100	Fix dependencies on ANGLE
#git cherry-pick --strategy=recursive -X patience c020526464fe2	 # michael.bruning@qt.io	Thu Dec 1 09:53:11 2016 +0100	Fix include order of texture_manager.h includes.
#git cherry-pick --strategy=recursive -X patience 37bd52f586cb0	 # michal.klocek@qt.io	Thu Nov 10 18:42:27 2016 +0100	Fix FORTIFY redefined warnings
#git cherry-pick --strategy=recursive -X patience a672b9c9c8a63	 # allan.jensen@theqtcompany.com	Fri Oct 16 13:19:37 2015 +0200	Prevent a python IOError on Windows due to MAX_PATH
#git cherry-pick --strategy=recursive -X patience d1775d0c285be	 # michael.bruning@qt.io	Mon Mar 20 12:10:23 2017 +0100	Windows: Fix file path too long problems in grit.py
#git cherry-pick --strategy=recursive -X patience 5d327f0b28a64	 # allan.jensen@qt.io	Mon Apr 8 10:49:28 2019 +0200	Improve the issue with long file names on windows
#git cherry-pick --strategy=recursive -X patience 3882bfd801801	 # jocelyn.turcotte@digia.com	Wed Jun 17 15:30:50 2015 +0200	Expose a status callback for the DevToolsHttpHandler
#git cherry-pick --strategy=recursive -X patience bcee009d8463a	 # allan.jensen@qt.io	Wed Feb 8 10:56:34 2017 +0100	Do not force an unnecessary march flag

#git cherry-pick --strategy=recursive -X patience 572acaacad03c	 # allan.jensen@qt.io	Wed Mar 1 10:11:00 2017 +0100	Make incremental linking configurable

#git cherry-pick --strategy=recursive -X patience e56054a9afe5f	 # allan.jensen@qt.io	Mon Mar 20 11:15:33 2017 +0100	Support external ozone platforms
#git cherry-pick --strategy=recursive -X patience cb383798dad93	 # michal.klocek@qt.io	Tue Apr 25 16:57:38 2017 +0200	Fix not working video in debug builds
#git cherry-pick --strategy=recursive -X patience c744374ffb9c8	 # alexandru.croitor@qt.io	Tue Apr 4 13:10:29 2017 +0200	Don't use the gesture detector for scrolls and flings on macOS
#git cherry-pick --strategy=recursive -X patience c9d286d7ed3ac	 # michal.klocek@qt.io	Tue Jan 3 14:46:48 2017 +0100	Fix Linux kernel lacking V4L2_CID_POWER_LINE_FREQUENCY_AUTO
#git cherry-pick --strategy=recursive -X patience bd9e1452c9e8b	 # allan.jensen@qt.io	Wed May 17 17:33:07 2017 +0200	Stop erronous deadlock errors in sandboxed debug mode
#git cherry-pick --strategy=recursive -X patience 74864ea7e6068	 # pvarga@inf.u-szeged.hu	Wed Jun 7 10:37:04 2017 +0200	Suppress error message on unneeded V8 external startup files
#git cherry-pick --strategy=recursive -X patience c96442460bf64	 # juri.valdmann@qt.io	Tue May 30 14:34:11 2017 +0200	Fix DCHECK with audio-only desktop capture
#git cherry-pick --strategy=recursive -X patience e87c3842d12b0	 # kai.koehne@qt.io	Wed May 18 16:35:21 2016 +0200	Adapt licenses.py for qdoc needs
#git cherry-pick --strategy=recursive -X patience e862384c90267	 # allan.jensen@theqtcompany.com	Thu Jan 7 10:03:04 2016 +0100	Add API for accessing isolated contexts
#git cherry-pick --strategy=recursive -X patience a6ce71fa494c3	 # allan.jensen@digia.com	Fri Aug 22 10:58:53 2014 +0200	Fix medium hinting on Linux with fontconfig and freetype
#git cherry-pick --strategy=recursive -X patience 32fa0dfcc83c9	 # allan.jensen@digia.com	Fri Aug 22 10:58:53 2014 +0200	Fix webfonts with wrong hinting on Linux
#git cherry-pick --strategy=recursive -X patience b40d62a1fe388	 # samuli.piippo@qt.io	Tue Mar 28 11:00:50 2017 +0300	Use target sysroot only with target toolchain
#git cherry-pick --strategy=recursive -X patience 43f5669f2bfad	 # allan.jensen@theqtcompany.com	Wed Jun 29 13:30:06 2016 +0200	Fix clang and embedded gcc builds
#git cherry-pick --strategy=recursive -X patience 6811d8300f2fb	 # allan.jensen@qt.io	Tue Apr 11 15:31:09 2017 +0200	Do not force the use of Google's custom clang binaries
#git cherry-pick --strategy=recursive -X patience 77c03dd71a0b6	 # allan.jensen@qt.io	Tue Mar 14 14:01:25 2017 +0100	Support linux-clang-libc++ builds
#git cherry-pick --strategy=recursive -X patience 07d1fc745ff19	 # michal.klocek@qt.io	Mon Jan 9 17:34:38 2017 +0100	Fix convert dict tool build
#git cherry-pick --strategy=recursive -X patience 48ae04a5838a5	 # allan.jensen@theqtcompany.com	Fri Apr 1 15:46:01 2016 +0200	Simplify naming of bdic dictionaries
#git cherry-pick --strategy=recursive -X patience 1634157ecf5bc	 # allan.jensen@theqtcompany.com	Tue Sep 13 14:52:02 2016 +0200	Forward declare newer EGL typedefs
#git cherry-pick --strategy=recursive -X patience a7d2659a6de4e	 # michal.klocek@qt.io	Thu Dec 1 18:25:53 2016 +0100	Remove whitelist for script_exec from .gn
#git cherry-pick --strategy=recursive -X patience 8489b226176ca	 # michal.klocek@qt.io	Mon Mar 6 15:41:18 2017 +0100	Fix incorrect dependency on shim headers
#git cherry-pick --strategy=recursive -X patience 1ed87e1676ec5	 # allan.jensen@theqtcompany.com	Mon Aug 8 10:50:37 2016 +0200	Fixup select elements.
#git cherry-pick --strategy=recursive -X patience f3f1c998ad122	 # michal.klocek@qt.io	Wed Dec 7 17:37:23 2016 +0100	Qt GN integration

#git cherry-pick --strategy=recursive -X patience 0cd5f92f8aee7	 # michal.klocek@qt.io	Sat Sep 12 17:22:04 2020 +0200	Add user script data mojo interface and traits
#git cherry-pick --strategy=recursive -X patience 97b491e6179e6	 # allan.jensen@qt.io	Tue Sep 12 13:45:10 2017 +0200	Fix Chrome resources and WebUI we need
#git cherry-pick --strategy=recursive -X patience bebe0597fa474	 # michal.klocek@qt.io	Mon Jun 25 19:56:11 2018 +0200	Add mojom for qtwebchannel interface
#git cherry-pick --strategy=recursive -X patience db4daf399c2da	 # allan.jensen@qt.io	Fri May 17 18:23:35 2019 +0200	Add mojom for renderer_configuration
#git cherry-pick --strategy=recursive -X patience b10b50ac685ef	 # michael.bruning@qt.io	Tue Dec 5 14:45:04 2017 +0100	Add extensions to Qt build and fix it up for building

#git cherry-pick --strategy=recursive -X patience d1f35365f3589	 # ztamas@inf.u-szeged.hu	Mon Feb 24 14:32:38 2020 +0100	Enable plugin.mojom for plugin placeholder
#git cherry-pick --strategy=recursive -X patience c1b6fc6d13fb1	 # michal.klocek@qt.io	Mon Nov 2 14:31:08 2020 +0100	Add WebEnginePageRenderFrame mojo interface
#git cherry-pick --strategy=recursive -X patience 7ac5f52784e22	 # psmaas@gmail.com	Sat Dec 26 22:24:56 2020 +0100	Add enable_webrtc property to make it build
#git cherry-pick --strategy=recursive -X patience 6b02a718e8bc7	 # allan.jensen@theqtcompany.com	Fri Jan 29 14:20:48 2016 +0100	Fix building without WebSpeech

#git cherry-pick --strategy=recursive -X patience c220ff9ce1e9c	 # allan.jensen@qt.io	Thu Jan 17 16:13:55 2019 +0100	Fix building on windows without toolkit_views
#git cherry-pick --strategy=recursive -X patience 95bbde799ade0	 # juri.valdmann@qt.io	Mon Mar 16 17:42:04 2020 +0100	Disable toolkit_views assert
#git cherry-pick --strategy=recursive -X patience 957cc738012e9	 # allan.jensen@qt.io	Tue Dec 5 15:08:40 2017 +0100	Fix override of malloc
#git cherry-pick --strategy=recursive -X patience df635e1baccd2	 # allan.jensen@qt.io	Thu Feb 15 17:57:59 2018 +0100	Avoid using libdrm

#git cherry-pick --strategy=recursive -X patience 55a9a5cce4654	 # allan.jensen@qt.io	Mon Nov 23 13:55:14 2020 +0100	Reinstate the virtual accessibility Destroy()
#git cherry-pick --strategy=recursive -X patience ef442a87e468d	 # jocelyn.turcotte@digia.com	Wed Nov 5 18:55:49 2014 +0100	Solve conflicts when including both QtOpenGL headers and resource_provider.h
#git cherry-pick --strategy=recursive -X patience 66cc390ab736e	 # juri.valdmann@qt.io	Tue May 28 11:00:10 2019 +0200	Use ui::Compositor (3rdparty)
#git cherry-pick --strategy=recursive -X patience 91153cbb619dc	 # juri.valdmann@qt.io	Thu Dec 12 12:31:12 2019 +0100	Fix FlingScheduler in viz mode
#git cherry-pick --strategy=recursive -X patience b4c038f04880a	 # allan.jensen@theqtcompany.com	Thu Aug 4 18:07:02 2016 +0200	Add accessors and seams for the Qt delegated renderer integration.

#git cherry-pick --strategy=recursive -X patience 76ef9a8598edf	 # allan.jensen@qt.io	Wed Jul 15 11:56:19 2020 +0200	Make navigation on back/forward mouse buttons optional
#git cherry-pick --strategy=recursive -X patience 779edfcf074c3	 # michal.klocek@theqtcompany.com	Thu Apr 28 19:47:46 2016 +0200	Update handling of loading the dictionary
#git cherry-pick --strategy=recursive -X patience 8cef642cdd642	 # juri.valdmann@qt.io	Thu Apr 19 12:14:44 2018 +0200	Extend url library for WebEngine custom schemes

#git cherry-pick --strategy=recursive -X patience 67eaab6bf97e5	 # juri.valdmann@qt.io	Tue Jan 23 10:36:52 2018 +0100	Adapt ProtocolHandlerRegistry for WebEngine

#git cherry-pick --strategy=recursive -X patience 65d65f4a87e5a	 # michal.klocek@theqtcompany.com	Mon Sep 28 20:35:32 2015 +0200	Integrate spell checker sources, fix compilation issues
#git cherry-pick --strategy=recursive -X patience f8d0405b134f2	 # allan.jensen@qt.io	Wed May 3 13:53:19 2017 +0200	Fix build to have spellchecker compilation optional
#git cherry-pick --strategy=recursive -X patience 69844eb7d8a13	 # pvarga@inf.u-szeged.hu	Wed Oct 2 08:17:17 2019 +0200	Fix initialization of SpellCheckService on macOS
#git cherry-pick --strategy=recursive -X patience c08766e95ddcd	 # allan.jensen@qt.io	Thu Sep 20 15:27:43 2018 +0200	Fix site_for_cookies for qrc resources
#git cherry-pick --strategy=recursive -X patience 20fa01046c252	 # allan.jensen@qt.io	Thu Oct 24 16:48:33 2019 +0200	Fix QRC cookies for tests with network-service

#git cherry-pick --strategy=recursive -X patience 87f6b290d58d5	 # allan.jensen@qt.io	Fri Jul 10 16:23:50 2020 +0200	Add cookie filter to URL requests cookie headers

#git cherry-pick --strategy=recursive -X patience 066574fa001cd	 # allan.jensen@qt.io	Mon Nov 23 12:53:51 2020 +0100	Allow us to set cookie_manager like android_webview
#git cherry-pick --strategy=recursive -X patience 4df3d936382d6	 # davidsz@inf.u-szeged.hu	Tue Sep 10 17:32:04 2019 +0200	Support qrc protocol in UrlPattern
#git cherry-pick --strategy=recursive -X patience fae3b25589ba6	 # allan.jensen@qt.io	Thu Jul 2 11:38:37 2020 +0200	Pass through a new application name argument to utility processes

#git cherry-pick --strategy=recursive -X patience 762160e583efc	 # michal.klocek@qt.io	Wed Apr 29 09:06:01 2020 +0200	Fix initialize of cdm for sandbox from widevine-path
#git cherry-pick --strategy=recursive -X patience 8aed5bb492999	 # juri.valdmann@qt.io	Tue Aug 13 14:53:41 2019 +0200	Enable android-specific fields of RenderFrameMetadata

#git cherry-pick --strategy=recursive -X patience 52c7ee9f1fed4	 # psmaas@gmail.com	Fri Jan 1 15:26:47 2021 +0100	If def the profile to make it easier to build without qt
#git cherry-pick --strategy=recursive -X patience 69a33cdcc7804	 # jocelyn.turcotte@digia.com	Tue Jun 11 15:44:26 2013 +0200	Add WebEngine classes as RunLoop/MessageLoop friends.
#git cherry-pick --strategy=recursive -X patience c376e718bc85b	 # juri.valdmann@qt.io	Fri Jan 24 14:42:17 2020 +0100	Expose StoragePartitionImpl::InitNetworkContext

#git cherry-pick --strategy=recursive -X patience d2661d939789b	 # allan.jensen@qt.io	Wed Feb 12 11:41:55 2020 +0100	Destroy old network context before creating the replacement
#git cherry-pick --strategy=recursive -X patience 81abe35ff2656	 # allan.jensen@qt.io	Wed Feb 12 11:40:24 2020 +0100	Allow changing user-agent without replace the entire network context
#git cherry-pick --strategy=recursive -X patience cc24c23f98565	 # allan.jensen@qt.io	Mon Aug 10 16:11:23 2020 +0200	Export SetBaseBackgroundColorOverride from WebView again
#git cherry-pick --strategy=recursive -X patience 3c84c444f6d4e	 # leander.beernaert@qt.io	Fri May 24 15:10:03 2019 +0200	Enable the option to remove previous user PrefService
#git cherry-pick --strategy=recursive -X patience 228dccfd40f3c	 # michal.klocek@qt.io	Mon Feb 19 12:54:27 2018 +0100	Switch to use glx over ozone
#git cherry-pick --strategy=recursive -X patience 9789fca130936	 # allan.jensen@theqtcompany.com	Fri Oct 9 13:55:28 2015 +0200	Allow late fullscreen changed signal
#git cherry-pick --strategy=recursive -X patience 918cf62b40530	 # michal.klocek@qt.io	Mon Mar 12 15:38:02 2018 +0100	Fix freezes of glx context
#git cherry-pick --strategy=recursive -X patience ecbcfcb00a2d1	 # michal.klocek@qt.io	Tue Mar 24 15:21:28 2020 +0100	Fix viz crash when cleanup
#git cherry-pick --strategy=recursive -X patience 97c640cc5ad4e	 # juri.valdmann@qt.io	Thu Nov 14 14:22:24 2019 +0100	Support GPU service on UI thread with viz
#git cherry-pick --strategy=recursive -X patience ed276116e3b3c	 # juri.valdmann@qt.io	Fri Aug 10 12:59:13 2018 +0200	Support non-base::Thread GPU thread
#git cherry-pick --strategy=recursive -X patience f330ef5021515	 # alexandru.croitor@qt.io	Mon Jul 31 11:10:26 2017 +0200	Don't use Chromium's OSExchangeDataProviderFactory::CreateProvider()
#git cherry-pick --strategy=recursive -X patience 021dee2c7e5bd	 # allan.jensen@qt.io	Mon Aug 3 13:45:55 2020 +0200	Decouple payment from content

#git cherry-pick --strategy=recursive -X patience ab57d2d32b7cc	 # allan.jensen@qt.io	Tue Jul 21 16:52:22 2020 +0200	Fix build after 83-merge

#git cherry-pick --strategy=recursive -X patience 6b192438cc8da	 # allan.jensen@qt.io	Thu Feb 13 15:36:52 2020 +0100	Fix build for expanded sources

#git cherry-pick --strategy=recursive -X patience 03b324c8ed83e	 # michael.bruning@theqtcompany.com	Fri Jan 15 11:26:31 2016 +0100	Fix printing sources for Qt and add them to the build.

#git cherry-pick --strategy=recursive -X patience a6c97ad234c69	 # davidsz@inf.u-szeged.hu	Wed Oct 24 14:28:30 2018 +0200	Disable some DCHECKs to fix printing
#git cherry-pick --strategy=recursive -X patience d8564de6fd0c9	 # davidsz@inf.u-szeged.hu	Tue Jul 10 16:54:17 2018 +0200	Enable high resolution printing
#git cherry-pick --strategy=recursive -X patience bc984ba77254a	 # allan.jensen@qt.io	Thu Oct 26 10:27:14 2017 +0200	Remove reference to safe_browsing constants
#git cherry-pick --strategy=recursive -X patience d27753cc619ab	 # allan.jensen@qt.io	Wed Nov 22 16:28:21 2017 +0100	Do not bundle the tracing UI resources

#git cherry-pick --strategy=recursive -X patience 7c55f331cfd32	 # zeno.albisser@digia.com	Wed Apr 23 16:54:47 2014 +0200	<chromium> Do not directly override libc symbols from the library.
#git cherry-pick --strategy=recursive -X patience 0d9060bf4234a	 # allan.jensen@qt.io	Mon Sep 2 13:53:59 2019 +0200	Post 77-merge and 79-merge fixups

#git cherry-pick --strategy=recursive -X patience 356c1d7541e0c	 # allan.jensen@qt.io	Mon Feb 6 11:13:24 2017 +0100	Reintroduce ninja_use_custom_environment_files
#git cherry-pick --strategy=recursive -X patience f746050d482ab	 # patricia@turtlesec.no	Mon Feb 1 17:30:52 2021 +0100	clang-cl compilefixes
#git cherry-pick --strategy=recursive -X patience 94986bdb702cd	 # allan.jensen@qt.io	Tue Feb 28 11:39:53 2017 +0100	Optionally unbundle libvpx, opus, FLAC, re2 and OpenH264

#git cherry-pick --strategy=recursive -X patience 9320dba016717	 # allan.jensen@qt.io	Wed Feb 8 13:55:03 2017 +0100	Unbundle Linux system libraries for GN
#git cherry-pick --strategy=recursive -X patience 678182ffab4e0	 # michal.klocek@qt.io	Mon Sep 23 10:12:09 2019 +0200	Improve jpeg headers handling
#git cherry-pick --strategy=recursive -X patience a15c859419930	 # allan.jensen@qt.io	Mon Mar 6 11:28:51 2017 +0100	Optionally link with system ffmpeg
#git cherry-pick --strategy=recursive -X patience 2aee24e2dd026	 # viktor.engelmann@qt.io	Tue May 2 15:48:46 2017 +0200	Allow Service Workers without HTTP headers (again)
#git cherry-pick --strategy=recursive -X patience 9f694f9ac73ba	 # alexandru.croitor@qt.io	Fri Jul 28 12:59:50 2017 +0200	Don't build Aura's gesture_nav_simple
#git cherry-pick --strategy=recursive -X patience cdac0c9aa8316	 # allan.jensen@qt.io	Mon Jul 17 13:40:47 2017 +0200	Do not build swiftshader when it is disabled

#git cherry-pick --strategy=recursive -X patience ddf8aacea9771	 # allan.jensen@qt.io	Thu Aug 10 12:29:07 2017 +0200	Disable termination on out of memory.
#git cherry-pick --strategy=recursive -X patience e01481e6c68ab	 # alexandru.croitor@qt.io	Wed May 17 16:53:20 2017 +0200	Add switch option for using OpenGL Core Profile in Chromium
#git cherry-pick --strategy=recursive -X patience 369e9282aa1ba	 # alexandru.croitor@qt.io	Wed Aug 30 15:11:42 2017 +0200	Windows: Fix incorrect relative path when linking .natvis files
#git cherry-pick --strategy=recursive -X patience c79ee453a4421	 # michal.klocek@qt.io	Thu Sep 7 12:05:08 2017 +0200	Fix headers for libpng in skia
#git cherry-pick --strategy=recursive -X patience 04323b59182ee	 # allan.jensen@qt.io	Fri Sep 15 15:42:49 2017 +0200	Do not assert on PPAPI resources we do not support.
#git cherry-pick --strategy=recursive -X patience 92756156f9f27	 # allan.jensen@qt.io	Tue Nov 14 10:50:31 2017 +0100	Fix assert with devtools
#git cherry-pick --strategy=recursive -X patience f23299696ced2	 # alexandru.croitor@qt.io	Mon Nov 20 10:42:27 2017 +0100	Use default MessageLoop type for NetworkConfigWatcherMac thread
#git cherry-pick --strategy=recursive -X patience c37c0e13777ef	 # pvarga@inf.u-szeged.hu	Thu Jan 17 09:37:01 2019 +0100	Disable allocator check

#git cherry-pick --strategy=recursive -X patience aaf69c645be8a	 # alexandru.croitor@qt.io	Fri Dec 15 19:14:18 2017 +0100	Fix hanging of process when application is closed too fast
#git cherry-pick --strategy=recursive -X patience eb3f0cea0ae3a	 # allan.jensen@qt.io	Mon Jan 22 13:14:41 2018 +0100	Make optimize_for_size an arg again
#git cherry-pick --strategy=recursive -X patience e301245c8e83f	 # zeno.albisser@theqtcompany.com	Fri Nov 28 17:53:02 2014 +0100	Leave a chance to all location providers to get a fix
#git cherry-pick --strategy=recursive -X patience be6ea041b3d3d	 # pierre.rossi@digia.com	Mon May 13 16:25:46 2013 +0200	Disable location requests to the geolocation google API
#git cherry-pick --strategy=recursive -X patience 3af4b9ee3d5ae	 # allan.jensen@qt.io	Wed Feb 7 14:41:08 2018 +0100	Fix render process crash for windows debug builds on win10
#git cherry-pick --strategy=recursive -X patience e938b46035359	 # allan.jensen@qt.io	Tue Feb 20 12:53:16 2018 +0100	Fix building on aarch64 without fp16
#git cherry-pick --strategy=recursive -X patience 529d3f52fc862	 # allan.jensen@qt.io	Mon Jun 26 13:17:39 2017 +0200	Do not launch zygote processes in single-process mode
#git cherry-pick --strategy=recursive -X patience 8c8296f392e6c	 # allan.jensen@qt.io	Tue Feb 27 14:41:08 2018 +0100	Pass original_request_url correctly (for view-source tests)
#git cherry-pick --strategy=recursive -X patience 93852e95efa52	 # psmaas@gmail.com	Sun Jan 17 02:54:05 2021 +0100	TurtleBrowser Compile Fixes

#git cherry-pick --strategy=recursive -X patience e9ed5a5f413e7	 # allan.jensen@qt.io	Tue Apr 17 16:24:21 2018 +0200	Pass virtual url of data url request back to the UI

#git cherry-pick --strategy=recursive -X patience 0b8eca9873261	 # alexandru.croitor@qt.io	Wed Feb 21 17:45:44 2018 +0100	Remove NOTREACHED in ScreenWin::GetNativeWindowFromHWND
#git cherry-pick --strategy=recursive -X patience 75e0018280810	 # allan.jensen@qt.io	Mon May 27 15:17:52 2019 +0200	Allow non-Chrome projects to run
#git cherry-pick --strategy=recursive -X patience 7f229b2531811	 # allan.jensen@qt.io	Fri Mar 22 16:21:57 2019 +0100	Allow shims in official builds
#git cherry-pick --strategy=recursive -X patience b5eba59a8b33c	 # alexandru.croitor@qt.io	Fri Aug 4 15:18:10 2017 +0200	[Windows] Disable warnings about mf.dll
#git cherry-pick --strategy=recursive -X patience 01f49149d4d89	 # viktor.engelmann@qt.io	Fri Aug 18 14:50:20 2017 +0200	Fix JPEG boolean values
#git cherry-pick --strategy=recursive -X patience e65fb732130c9	 # allan.jensen@qt.io	Fri Dec 16 10:55:58 2016 +0100	Don't generate Java bindings
#git cherry-pick --strategy=recursive -X patience 5321c9ad12b64	 # pvarga@inf.u-szeged.hu	Thu Aug 10 11:37:05 2017 +0200	Fix Renderer and GPU threads on windows
#git cherry-pick --strategy=recursive -X patience a58e83d7c2b82	 # allan.jensen@qt.io	Fri Sep 21 11:38:36 2018 +0200	Do not assert on --disable-gpu
#git cherry-pick --strategy=recursive -X patience ff4a10682d85f	 # alexandru.croitor@qt.io	Mon Jul 16 18:47:07 2018 +0200	Fix --single-process --disable-gpu combination not to hit asserts
#git cherry-pick --strategy=recursive -X patience 457aa028b3a11	 # alexandru.croitor@qt.io	Mon Jul 16 18:51:44 2018 +0200	Reduce severity level of messages when kDisableGpu switch is used
#git cherry-pick --strategy=recursive -X patience 9ea72e9c6eb01	 # allan.jensen@qt.io	Thu Nov 14 17:38:02 2019 +0100	Fix url_utils for QtWebEngine
#git cherry-pick --strategy=recursive -X patience de9d0b3e7fb4f	 # allan.jensen@qt.io	Fri Feb 10 16:09:38 2017 +0100	Add remove_v8base_debug_symbols to GN
#git cherry-pick --strategy=recursive -X patience 1ffbdf8773284	 # allan.jensen@qt.io	Thu May 17 16:00:33 2018 +0200	Use devtools app for Qt
#git cherry-pick --strategy=recursive -X patience f879de59b43cf	 # michal.klocek@qt.io	Thu Jun 7 17:26:44 2018 +0200	Drop constexpr from constructors in pdfium StringView
#git cherry-pick --strategy=recursive -X patience 03e0ec2718149	 # kirill.burtsev@qt.io	Mon Dec 9 16:23:58 2019 +0100	third_party perfetto: add missing include for clang, asan and no_pch
#git cherry-pick --strategy=recursive -X patience 1998cd95df92c	 # allan.jensen@qt.io	Sun Aug 12 14:26:22 2018 +0200	Bump maximum number of custom isolated world ids
#git cherry-pick --strategy=recursive -X patience ee7d33a54e367	 # allan.jensen@qt.io	Fri Aug 31 17:56:12 2018 +0200	Fix code_generator.py for Windows paths
#git cherry-pick --strategy=recursive -X patience 89b391ee27621	 # allan.jensen@qt.io	Tue Sep 18 13:17:51 2018 +0200	Fix non-desktop Linux builds
#git cherry-pick --strategy=recursive -X patience cf9d0dd85ee29	 # allan.jensen@qt.io	Sun Oct 21 18:42:44 2018 +0200	Fix crashes on exit
#DROP git cherry-pick --strategy=recursive -X patience d1e7054c63204	 # allan.jensen@qt.io	Sat Oct 27 11:30:28 2018 +0200	Make scroll animation less "drunk"

#git cherry-pick --strategy=recursive -X patience 9c6a974c2fed4	 # alexandru.croitor@qt.io	Tue Nov 6 11:17:53 2018 +0100	Stop orphan child processes from staying alive on Windows
#git cherry-pick --strategy=recursive -X patience 79067ce023851	 # michal.klocek@qt.io	Fri Nov 9 09:49:18 2018 +0100	Do not make tools for webkit layout tests
#git cherry-pick --strategy=recursive -X patience 88496c0c9ab67	 # alexandru.croitor@qt.io	Thu Jan 17 17:46:08 2019 +0100	Pass Qt Prefix path to the macOS V2 Seatbelt Sandbox
#git cherry-pick --strategy=recursive -X patience fdae9bc14bfb4	 # michal.klocek@qt.io	Wed Nov 14 10:57:31 2018 +0100	Minor. Drop dependency for ffmpeg for test_support
#git cherry-pick --strategy=recursive -X patience c3313d416f0e9	 # pvarga@inf.u-szeged.hu	Wed Jan 30 15:17:57 2019 +0100	Make text selection handles available on macOS too
#git cherry-pick --strategy=recursive -X patience 2a8779169656d	 # pvarga@inf.u-szeged.hu	Wed Mar 6 14:26:52 2019 +0100	Remove assert on exit
#git cherry-pick --strategy=recursive -X patience 1892d0b2c937e	 # allan.jensen@qt.io	Tue Jun 4 16:28:57 2019 +0200	Disable crash-reports when reporting is disabled

#git cherry-pick --strategy=recursive -X patience e01a5b69f816b	 # allan.jensen@qt.io	Thu Feb 7 17:33:53 2019 +0100	[Revert] Remove an MSVC-required macro.
#git cherry-pick --strategy=recursive -X patience f1ee2bdf8d048	 # allan.jensen@qt.io	Thu Aug 30 17:16:53 2018 +0200	[Revert] Remove base::internal::PassingTraits
#git cherry-pick --strategy=recursive -X patience b2c01e4e5460c	 # juri.valdmann@qt.io	Mon Mar 16 16:31:24 2020 +0100	[Revert] Always strip absolute paths from debug symbols.
#git cherry-pick --strategy=recursive -X patience 12f925111bfa3	 # allan.jensen@qt.io	Mon Jun 24 14:58:15 2019 +0200	Fix zygote path used
#git cherry-pick --strategy=recursive -X patience fc75ae4d29350	 # alexandru.croitor@qt.io	Fri Jul 12 17:21:33 2019 +0200	Protect against nullptr dereference in GetSelectedText
#git cherry-pick --strategy=recursive -X patience 880fc9f2d4855	 # michael.bruning@qt.io	Wed Jul 3 18:16:39 2019 +0200	Use dsymutil from the sdk instead of a bundled one
#git cherry-pick --strategy=recursive -X patience af5b86cc52282	 # michal.klocek@qt.io	Thu Jun 20 09:09:53 2019 +0200	Fix segfaults with arm 32bit on metrics
#git cherry-pick --strategy=recursive -X patience fffffe9ef7968	 # michael.bruning@qt.io	Thu Feb 28 13:54:08 2019 +0100	Fix use of C++17 constexpr variadic templates
#git cherry-pick --strategy=recursive -X patience 0290717a8809b	 # allan.jensen@qt.io	Fri Aug 31 17:11:24 2018 +0200	Unbreak FFMPEG on windows
#git cherry-pick --strategy=recursive -X patience 029307981f796	 # allan.jensen@qt.io	Wed Feb 20 10:41:49 2019 +0100	Disable responsiveness watcher
#DROP git cherry-pick --strategy=recursive -X patience b4f59f8be1356	 # michal.klocek@qt.io	Thu Feb 14 13:09:01 2019 +0100	Fix build with sanitizer and icecc

#git cherry-pick --strategy=recursive -X patience 9e0986cbadb35	 # allan.jensen@qt.io	Thu May 3 15:29:01 2018 +0200	Post 67-merge, 71-merge, 73-merge and 75-merge fixups
#git cherry-pick --strategy=recursive -X patience f0bd6e9636bd5	 # allan.jensen@theqtcompany.com	Tue Jan 12 10:15:34 2016 +0100	Fix CDM on OSX and Windows with component installer (widevine)
#git cherry-pick --strategy=recursive -X patience d3259e87d2d84	 # michal.klocek@qt.io	Tue Feb 26 13:47:00 2019 +0100	Soften check for single thread only if layer1 or layer2 sandbox
#git cherry-pick --strategy=recursive -X patience 0f0e265d5a54d	 # pvarga@inf.u-szeged.hu	Thu Apr 18 11:09:13 2019 +0200	Silence assert on MessageWindow::WindowClass destruction
#git cherry-pick --strategy=recursive -X patience e08865246096b	 # michael.bruning@qt.io	Fri May 17 16:41:43 2019 +0200	Try different versions when creating a CoreProfile context on macOS
#git cherry-pick --strategy=recursive -X patience bcb9e5c174a8b	 # allan.jensen@qt.io	Fri Jun 7 14:18:23 2019 +0200	Fix changing should_override_user_agent_in_new_tabs_

#git cherry-pick --strategy=recursive -X patience ca7d973974cba	 # michal.klocek@qt.io	Tue Jan 31 17:21:13 2017 +0100	Remove linking with libatomic
#git cherry-pick --strategy=recursive -X patience 90c0aa35d11bd	 # allan.jensen@qt.io	Tue Jun 4 15:12:15 2019 +0200	Support ubsan and asan on GCC
#DROP git cherry-pick --strategy=recursive -X patience bde7deecb3fea	 # ztamas@inf.u-szeged.hu	Tue Jul 9 15:40:00 2019 +0200	Fix iterating when erasing last element from task queue

#git cherry-pick --strategy=recursive -X patience 68dab3ac44182	 # allan.jensen@qt.io	Tue Nov 12 13:53:29 2019 +0100	Fix is_main_frame in intercept_navigation_throttle

#git cherry-pick --strategy=recursive -X patience b794ff723b3dc	 # michael.bruning@qt.io	Tue Apr 9 22:30:16 2019 +0200	Include root_layer_size in CompositorFrameMetadata again
#git cherry-pick --strategy=recursive -X patience abb2b644a7fa7	 # michael.bruning@qt.io	Mon Feb 18 12:22:01 2019 +0100	Disable download and print buttons in PDF viewer
#git cherry-pick --strategy=recursive -X patience 5f705218e7768	 # juri.valdmann@qt.io	Tue Sep 4 15:25:45 2018 +0200	Restore media::FFmpegGlue::InitializeFFmpeg()
#git cherry-pick --strategy=recursive -X patience 2410af908b642	 # allan.jensen@qt.io	Wed Feb 21 14:41:47 2018 +0100	Fix crossbuilds of v8 snapshots
#git cherry-pick --strategy=recursive -X patience f63ec5912dd83	 # davidsz@inf.u-szeged.hu	Fri Aug 30 18:01:06 2019 +0200	Fix pressure of tablet events
#git cherry-pick --strategy=recursive -X patience 2a23c2622b16c	 # ztamas@inf.u-szeged.hu	Tue Oct 8 14:26:59 2019 +0200	Fix crash on exit on Windows
#git cherry-pick --strategy=recursive -X patience dd4b10ce6b578	 # michael.bruning@qt.io	Mon Mar 26 17:51:48 2018 +0200	Convert asserts to logs and returns in the PpapiHost
#git cherry-pick --strategy=recursive -X patience fbd338181cc1e	 # juri.valdmann@qt.io	Thu Oct 17 12:26:27 2019 +0200	Disable long presentation time DCHECK
#git cherry-pick --strategy=recursive -X patience 64db3fbdcafef	 # allan.jensen@qt.io	Thu Oct 10 18:28:12 2019 +0200	Fixup rtc_use_x11
#git cherry-pick --strategy=recursive -X patience d35b485efb70a	 # michael.bruning@qt.io	Tue Nov 12 18:25:30 2019 +0100	[macOS] Fix build error with new deployment target
#git cherry-pick --strategy=recursive -X patience 00a7ed42d4f53	 # juri.valdmann@qt.io	Fri Nov 15 15:31:11 2019 +0100	Fix pdfium build on macOS
#git cherry-pick --strategy=recursive -X patience 7450dea14c068	 # michal.klocek@qt.io	Mon Jan 13 17:30:52 2020 +0100	Fix crash on page allocator
#DROP git cherry-pick --strategy=recursive -X patience 477af8ad6fcf6	 # allan.jensen@qt.io	Mon Feb 10 10:40:26 2020 +0100	Suppress assert

#git cherry-pick --strategy=recursive -X patience 9b8246b978d36	 # allan.jensen@qt.io	Thu Mar 19 13:25:28 2020 +0100	Fix build with MSVC standard library
#git cherry-pick --strategy=recursive -X patience cfcdf0ac90e06	 # pvarga@inf.u-szeged.hu	Thu Feb 13 08:27:27 2020 +0100	Suppress DCHECK triggered by NGInlineNode::ComputeMinMaxSize
#git cherry-pick --strategy=recursive -X patience 7c49ea31f7ad2	 # allan.jensen@qt.io	Thu Aug 22 13:15:07 2019 +0200	Restore -fno-delete-null-pointer-checks
#git cherry-pick --strategy=recursive -X patience c34563941aa42	 # allan.jensen@qt.io	Tue Jan 28 14:22:30 2020 +0100	Suppress racy DCHECK
#git cherry-pick --strategy=recursive -X patience 287f9024ef9c7	 # juri.valdmann@qt.io	Mon Mar 16 19:39:45 2020 +0100	Allow disabling SurfaceLayer for videos on non-Android platforms

#git cherry-pick --strategy=recursive -X patience f9e1ab046ff16	 # juri.valdmann@qt.io	Thu Mar 26 12:17:18 2020 +0100	Invalidate cached selection bounds on scrolling
#git cherry-pick --strategy=recursive -X patience cfa62a80f99e6	 # juri.valdmann@qt.io	Mon Mar 16 14:35:21 2020 +0100	Fix build after 80-merge
#git cherry-pick --strategy=recursive -X patience 65d960f851a08	 # pvarga@inf.u-szeged.hu	Thu Mar 26 16:42:11 2020 +0100	Guard third-party heap in V8
#git cherry-pick --strategy=recursive -X patience 4268a024d5cc3	 # allan.jensen@qt.io	Thu Apr 2 15:34:21 2020 +0200	Fix build with PDF disabled

#git cherry-pick --strategy=recursive -X patience 35e8587dbf565	 # juri.valdmann@qt.io	Sat Apr 4 06:17:54 2020 +0200	Stop sending ViewMsg_SetBackgroundOpaque to renderer
#git cherry-pick --strategy=recursive -X patience 692ad6261d1f9	 # ztamas@inf.u-szeged.hu	Mon Sep 30 10:51:14 2019 +0200	Fix skia crash on Windows after 77-merge
#git cherry-pick --strategy=recursive -X patience 6a7076a543a1f	 # allan.jensen@qt.io	Mon Mar 9 15:33:33 2020 +0100	Fix ozone builds of ANGLE
#git cherry-pick --strategy=recursive -X patience 6af24fa281dde	 # allan.jensen@qt.io	Tue Apr 21 11:52:48 2020 +0200	Fix crash in file-selector tests
#git cherry-pick --strategy=recursive -X patience efca732ac6c09	 # pvarga@inf.u-szeged.hu	Tue Apr 21 16:57:13 2020 +0200	Disable alternate window station of Windows sandbox
#git cherry-pick --strategy=recursive -X patience 3ae701417a115	 # juri.valdmann@qt.io	Wed Feb 19 14:15:34 2020 +0100	Fix recursive deadlock in sandbox::InitLibcLocaltimeFunctions
#git cherry-pick --strategy=recursive -X patience a96728083b7de	 # allan.jensen@qt.io	Thu Apr 23 10:20:27 2020 +0200	Speculative fix for xkbcommon include
#git cherry-pick --strategy=recursive -X patience 42e1a39cb52f6	 # pvarga@inf.u-szeged.hu	Thu Jun 4 13:06:44 2020 +0200	Enable NativeThemeAura on macOS too

#git cherry-pick --strategy=recursive -X patience 186400725a8bb	 # michal.klocek@qt.io	Thu Jun 25 14:36:16 2020 +0200	Add missing include in certificate net log
#DROP git cherry-pick --strategy=recursive -X patience 45d522c6d9e3b	 # allan.jensen@qt.io	Fri Jun 26 13:17:40 2020 +0200	Fix libjpeg_turbo for ARM32

#git cherry-pick --strategy=recursive -X patience 93e80129a08f4	 # michal.klocek@qt.io	Wed Jul 1 13:37:17 2020 +0200	Fix angle_platform_impl after 80 rebase
#git cherry-pick --strategy=recursive -X patience 1c9848b862054	 # allan.jensen@qt.io	Thu Aug 6 11:43:22 2020 +0200	Fix debug-info in MSVC developer-builds

# Test Failures
# Linux: [Test] base_unittests : Has Failures
# Linux: [Test] net_unittests : Has Failures
# Linux: [Test] pdfium_unittests : Has Failures
# Linux: [Test] services_unittests : Has Failures

#DROP git cherry-pick --strategy=recursive -X patience bb1bf36749380	 # allan.jensen@qt.io	Mon Aug 3 15:30:28 2020 +0200	[Revert] Update base/ for 10.15 SDK requirement

#git cherry-pick --strategy=recursive -X patience 1b89e15eedaa9	 # allan.jensen@qt.io	Thu Aug 6 10:13:34 2020 +0200	Fix crashes with MSVC post 83 merge
#git cherry-pick --strategy=recursive -X patience 5aabbd0f57af3	 # allan.jensen@qt.io	Mon Aug 3 12:50:06 2020 +0200	Fix debug builds
#git cherry-pick --strategy=recursive -X patience 9b301681bfbdd	 # allan.jensen@qt.io	Tue Aug 18 13:34:53 2020 +0200	Remove blocking of proper fixes
#git cherry-pick --strategy=recursive -X patience d30a9c3ee9a00	 # pvarga@inf.u-szeged.hu	Fri Aug 28 14:06:37 2020 +0200	Disable NetworkServiceSandbox on macOS by default
#git cherry-pick --strategy=recursive -X patience e1ac90377b39e	 # allan.jensen@qt.io	Mon Aug 31 16:28:09 2020 +0200	[Revert] Pass -D to libtool instead of setting ZERO_AR_DATE.

#git cherry-pick --strategy=recursive -X patience 061dfe60de605	 # allan.jensen@qt.io	Tue Aug 4 15:55:56 2020 +0200	Fixups post 83-merge for Windows

#git cherry-pick --strategy=recursive -X patience fba1649e0cdf5	 # pvarga@inf.u-szeged.hu	Wed Sep 2 09:15:16 2020 +0200	Do not request BadgeService interface
#git cherry-pick --strategy=recursive -X patience 94b96ddeb9887	 # allan.jensen@qt.io	Tue Sep 1 09:48:32 2020 +0200	[Revert] Update various bits of Chromium to require the 10.15 SDK.
#git cherry-pick --strategy=recursive -X patience 3e191787e6345	 # allan.jensen@qt.io	Wed Sep 9 12:19:59 2020 +0200	Allow --disable-gpu to disable gpu thread/process
#git cherry-pick --strategy=recursive -X patience 6e1aa07ab966c	 # pvarga@inf.u-szeged.hu	Thu Oct 29 10:01:00 2020 +0100	Add minimal webrtcdesktopcapture api for hangout services extension

#git cherry-pick --strategy=recursive -X patience 70755273ffaf0	 # allan.jensen@qt.io	Fri Jan 15 13:16:25 2021 +0100	Keep the close button when "undocked", as we can dock differently
#git cherry-pick --strategy=recursive -X patience 5e475d6616b83	 # davidsz@inf.u-szeged.hu	Thu Jan 21 02:11:02 2021 +0100	Implement resourcesPrivate API
#git cherry-pick --strategy=recursive -X patience a1d9684d8b959	 # allan.jensen@qt.io	Wed Dec 2 14:06:55 2020 +0100	Add AvailabilityVersions.h fallback
#git cherry-pick --strategy=recursive -X patience dceb0f65703c8	 # pvarga@inf.u-szeged.hu	Thu Dec 17 15:17:12 2020 +0100	Use color chooser if FormControlsRefresh is enabled
#UNSURE git cherry-pick --strategy=recursive -X patience 0c060399ac161	 # zeno.albisser@digia.com	Wed Jul 24 15:54:50 2013 +0200	<tools/grit> GRIT: Allow grd files outside of chromium source dir.

#git cherry-pick --strategy=recursive -X patience 9428c8947c5d1	 # allan.jensen@qt.io	Tue Sep 22 18:48:10 2020 +0200	Only upgrade to WebSocket when WebSocket was requested
#git cherry-pick --strategy=recursive -X patience 6053cdcec7004	 # allan.jensen@theqtcompany.com	Mon Aug 31 17:39:26 2015 +0200	Forward cleared selections

#git cherry-pick --strategy=recursive -X patience 1e0ea22f67c64	 # allan.jensen@qt.io	Tue Dec 8 14:27:40 2020 +0100	Disable swift configuration

#git cherry-pick --strategy=recursive -X patience 2b5335e241619	 # allan.jensen@qt.io	Mon Aug 3 14:04:56 2020 +0200	Do not depend on soda on Linux

#git cherry-pick --strategy=recursive -X patience a46ac7d68a89e	 # allan.jensen@qt.io	Thu Nov 19 16:51:59 2020 +0100	Fixups post 87

#git cherry-pick --strategy=recursive -X patience f9d385e94affd	 # allan.jensen@qt.io	Fri Nov 20 17:15:12 2020 +0100	Refix quota for non-host based urls
#git cherry-pick --strategy=recursive -X patience 5a87740076a35	 # psmaas@gmail.com	Wed Jan 6 10:49:46 2021 +0100	Add xcb dependencies

#git cherry-pick --strategy=recursive -X patience a9ed191cfccc3	 # ztamas@inf.u-szeged.hu	Fri Jan 22 08:46:04 2021 +0100	Make GpuSwitchingManager::RemoveObserver() thread safe
#git cherry-pick --strategy=recursive -X patience 16f893962d480	 # kirill.burtsev@qt.io	Wed Jan 20 17:31:39 2021 +0100	Correct DCHECK on ApplyTouchAdjustment for adjusted touch point
#MOVE git cherry-pick --strategy=recursive -X patience 43c0130c41c35	 # allan.jensen@qt.io	Wed May 29 11:57:45 2019 +0200	Fix perfetto on MSVC

#git cherry-pick --strategy=recursive -X patience ca7e06ed147f7	 # alexandru.croitor@qt.io	Wed Aug 1 16:32:55 2018 +0200	Work around MSVC2017 optimizer bug when printing a page usind Pdfium
#git cherry-pick --strategy=recursive -X patience a23ea5643e3de	 # allan.jensen@qt.io	Wed Jun 5 15:22:31 2019 +0200	Work-around MSVC bug with base::Optional<LayoutUnit>

#git cherry-pick --strategy=recursive -X patience a34eeaa733841	 # allan.jensen@qt.io	Wed Feb 5 12:52:04 2020 +0100	Fixes for building with MSVC
#git cherry-pick --strategy=recursive -X patience a223816a13663	 # pvarga@inf.u-szeged.hu	Fri Nov 13 11:09:23 2020 +0100	Fix build with msvc2019 16.8.0
#git cherry-pick --strategy=recursive -X patience b2e198d0407ba	 # pvarga@inf.u-szeged.hu	Tue Dec 22 15:05:39 2020 +0100	Fix build with MSVC 2017 after 87 merge

#git cherry-pick --strategy=recursive -X patience 038176baca3d3	 # allan.jensen@qt.io	Wed Dec 9 15:26:58 2020 +0100	Fix build with MSVC 2019 after 87 merge

#git cherry-pick --strategy=recursive -X patience e50d1064933cd	 # patricia@turtlesec.no	Wed Feb 3 20:58:12 2021 +0100	Don't diff files generated by midl.py and message_compiler.py - the diffs only work with Google setup

#git cherry-pick --strategy=recursive -X patience 5f3c6694baa2c	 # allan.jensen@qt.io	Thu Nov 26 12:08:50 2020 +0100	[Revert] ui/gl: Remove WGL support on Windows
#git cherry-pick --strategy=recursive -X patience ae4a8b7030852	 # alexandru.croitor@qt.io	Tue Aug 22 19:03:54 2017 +0200	Support using software GL implementation opengl32sw.dll on Windows
#git cherry-pick --strategy=recursive -X patience bf3c1f307217d	 # kai.koehne@qt.io	Thu Mar 15 11:16:06 2018 +0100	Win: Fix crashes when initializing GPU thread

#DROP??? git cherry-pick --strategy=recursive -X patience 64b74dc06eeb7	 # psmaas@gmail.com	Tue Feb 23 18:36:30 2021 +0100	TurtleBrowser: no idea why this gives a link error
#UNSURE git cherry-pick --strategy=recursive -X patience d5f71fbe35ed9	 # allan.jensen@qt.io	Thu Jul 18 13:28:52 2019 +0200	Fix Windows sandbox for heterogeneous executables

#git cherry-pick --strategy=recursive -X patience c8184ba625246	 # allan.jensen@qt.io	Thu Apr 30 11:17:51 2020 +0200	Build devtools modules with system nodejs

# Windows
# Check git cherry-pick --strategy=recursive -X patience 061dfe60de605
# File third_party/perfetto/include/perfetto/protozero/proto_utils.h
# TRY ON WINDOWS
# git cherry-pick --strategy=recursive -X patience 43c0130c41c35	 # allan.jensen@qt.io	Wed May 29 11:57:45 2019 +0200	Fix perfetto on MSVC
# git cherry-pick --strategy=recursive -X patience d5f71fbe35ed9	 # allan.jensen@qt.io	Thu Jul 18 13:28:52 2019 +0200	Fix Windows sandbox for heterogeneous executables

# NOT SURE ABOUT THIS
# git cherry-pick --strategy=recursive -X patience c8184ba625246	 # allan.jensen@qt.io	Thu Apr 30 11:17:51 2020 +0200	Build devtools modules with system nodejs