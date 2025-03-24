{pkgs, ...}: {
  home.packages = [
    pkgs.vesktop
  ];

  home.file = let
    vesktopPath =
      if pkgs.stdenv.isDarwin
      then "Library/Application\ Support/vesktop/"
      else ".config/vesktop";
  in {
    "${vesktopPath}/themes/deishuu.css".text = ''
      /**
       * @name system24
       * @description A tui-style discord theme generated with home manager.
       * @author refact0r
       * @version 1.0.0
       * @source https://github.com/refact0r/system24/blob/master/system24.theme.css
       * @authorId 508863359777505290
       * @authorLink https://www.refact0r.dev
      */

      /* import theme modules */
      @import url('https://refact0r.github.io/system24/src/main.css'); /* main theme css. DO NOT REMOVE */
      @import url('https://refact0r.github.io/system24/src/unrounding.css'); /* gets rid of all rounded corners. remove if you want rounded corners. */

      /* customize things here */
      :root {
      	--font: 'DM Mono'; /* UI font name. it must be installed on your system. */
      	letter-spacing: -0.05ch; /* decreases letter spacing for better readability. */
      	font-weight: 300; /* UI font weight. */
      	--label-font-weight: 500; /* font weight for panel labels. */
      	--corner-text: 'system24'; /* custom text to display in the corner. only works on windows. */
      	--pad: 16px; /* padding between panels. */
      	--txt-pad: 10px; /* padding inside panels to prevent labels from clipping */
      	--panel-roundness: 0px; /* corner roundness of panels. ONLY WORKS IF unrounding.css IS REMOVED (see above). */

      	/* background colors */
      	--bg-0: oklch(19% 0 0); /* main background color. */
      	--bg-1: oklch(23% 0 0); /* background color for secondary elements like code blocks, embeds, etc. */
      	--bg-2: oklch(27% 0 0); /* color of neutral buttons. */
      	--bg-3: oklch(31% 0 0); /* color of neutral buttons when hovered. */

      	/* state modifiers */
      	--hover: oklch(54% 0 0 / 0.1); /* color of hovered elements. */
      	--active: oklch(54% 0 0 / 0.2); /* color of elements when clicked. */
      	--selected: var(--active); /* color of selected elements. */

      	/* text colors */
      	--txt-dark: var(--bg-0); /* color of dark text on colored backgrounds. */
      	--txt-link: var(--cyan); /* color of links. */
      	--txt-0: oklch(90% 0 0); /* color of bright/white text. */
      	--txt-1: oklch(80% 0 0); /* main text color. */
      	--txt-2: oklch(60% 0 0); /* color of secondary text like channel list. */
      	--txt-3: oklch(40% 0 0); /* color of muted text. */

      	/* accent colors */
      	--acc-0: white; /* main accent color. */
      	--acc-1: white; /* color of accent buttons when hovered. */
      	--acc-2: white; /* color of accent buttons when clicked. */

      	/* borders */
      	--border-width: 2px; /* panel border thickness. */
      	--border-color: var(--bg-3); /* panel border color. */
      	--border-hover-color: var(--acc-0); /* panel border color when hovered. */
      	--border-transition: 0.2s ease; /* panel border transition. */

      	/* status dot colors */
      	--online-dot: var(--green); /* color of online dot. */
      	--dnd-dot: var(--pink); /* color of do not disturb dot. */
      	--idle-dot: var(--yellow); /* color of idle dot. */
      	--streaming-dot: white; /* color of streaming dot. */

      	/* mention/ping and message colors */
      	--mention-txt: var(--acc-0); /* color of mention text. */
      	--mention-bg: color-mix(in oklch, var(--acc-0), transparent 90%); /* background highlight of mention text. */
      	--mention-overlay: color-mix(in oklch, var(--acc-0), transparent 90%); /* overlay color of messages that mention you. */
      	--mention-hover-overlay: color-mix(in oklch, var(--acc-0), transparent 95%); /* overlay color of messages that mention you when hovered. */
      	--reply-overlay: var(--active); /* overlay color of message you are replying to. */
      	--reply-hover-overlay: var(--hover); /* overlay color of message you are replying to when hovered. */

      	/* color shades */
      	--pink: oklch(73% 0.12 0);
      	--pink-1: oklch(63% 0.12 0);
      	--pink-2: oklch(53% 0.12 0);
      	--purple: oklch(73% 0.12 300);
      	--purple-1: oklch(63% 0.12 300);
      	--purple-2: oklch(53% 0.12 300);
      	--cyan: oklch(73% 0.12 200);
      	--yellow: oklch(78% 0.12 80);
      	--green: oklch(73% 0.12 160);
      	--green-1: oklch(63% 0.12 160);
      	--green-2: oklch(53% 0.12 160);
      }
    '';
    "${vesktopPath}/settings/settings.json".text = ''
      {
          "autoUpdate": true,
          "autoUpdateNotification": true,
          "useQuickCss": true,
          "themeLinks": [],
          "enabledThemes": ["deishuu.css"],
          "enableReactDevtools": false,
          "frameless": false,
          "transparent": false,
          "winCtrlQ": false,
          "disableMinSize": false,
          "winNativeTitleBar": false,
          "plugins": {
              "ChatInputButtonAPI": {
                  "enabled": true
              },
              "CommandsAPI": {
                  "enabled": true
              },
              "DynamicImageModalAPI": {
                  "enabled": true
              },
              "MemberListDecoratorsAPI": {
                  "enabled": false
              },
              "MessageAccessoriesAPI": {
                  "enabled": true
              },
              "MessageDecorationsAPI": {
                  "enabled": false
              },
              "MessageEventsAPI": {
                  "enabled": true
              },
              "MessagePopoverAPI": {
                  "enabled": false
              },
              "MessageUpdaterAPI": {
                  "enabled": true
              },
              "ServerListAPI": {
                  "enabled": true
              },
              "UserSettingsAPI": {
                  "enabled": true
              },
              "AccountPanelServerProfile": {
                  "enabled": false
              },
              "AlwaysAnimate": {
                  "enabled": true
              },
              "AlwaysExpandRoles": {
                  "enabled": false
              },
              "AlwaysTrust": {
                  "enabled": false
              },
              "AnonymiseFileNames": {
                  "enabled": false
              },
              "AppleMusicRichPresence": {
                  "enabled": false
              },
              "WebRichPresence (arRPC)": {
                  "enabled": false
              },
              "BANger": {
                  "enabled": false
              },
              "BetterFolders": {
                  "enabled": true,
                  "sidebar": true,
                  "showFolderIcon": 1,
                  "keepIcons": false,
                  "closeAllHomeButton": false,
                  "closeAllFolders": false,
                  "forceOpen": false,
                  "sidebarAnim": true,
                  "closeOthers": false
              },
              "BetterGifAltText": {
                  "enabled": false
              },
              "BetterGifPicker": {
                  "enabled": false
              },
              "BetterNotesBox": {
                  "enabled": false
              },
              "BetterRoleContext": {
                  "enabled": false
              },
              "BetterRoleDot": {
                  "enabled": false
              },
              "BetterSessions": {
                  "enabled": false
              },
              "BetterSettings": {
                  "enabled": false
              },
              "BetterUploadButton": {
                  "enabled": false
              },
              "BiggerStreamPreview": {
                  "enabled": true
              },
              "BlurNSFW": {
                  "enabled": false
              },
              "CallTimer": {
                  "enabled": true
              },
              "ClearURLs": {
                  "enabled": false
              },
              "ClientTheme": {
                  "enabled": false
              },
              "ColorSighted": {
                  "enabled": false
              },
              "ConsoleJanitor": {
                  "enabled": false
              },
              "ConsoleShortcuts": {
                  "enabled": false
              },
              "CopyEmojiMarkdown": {
                  "enabled": false
              },
              "CopyFileContents": {
                  "enabled": false
              },
              "CopyUserURLs": {
                  "enabled": false
              },
              "CrashHandler": {
                  "enabled": true
              },
              "CtrlEnterSend": {
                  "enabled": false
              },
              "CustomRPC": {
                  "enabled": false
              },
              "CustomIdle": {
                  "enabled": false
              },
              "Dearrow": {
                  "enabled": false
              },
              "Decor": {
                  "enabled": false
              },
              "DisableCallIdle": {
                  "enabled": false
              },
              "DontRoundMyTimestamps": {
                  "enabled": false
              },
              "EmoteCloner": {
                  "enabled": false
              },
              "Experiments": {
                  "enabled": false
              },
              "F8Break": {
                  "enabled": false
              },
              "FakeNitro": {
                  "enabled": true,
                  "enableStickerBypass": true,
                  "enableStreamQualityBypass": true,
                  "enableEmojiBypass": true,
                  "transformEmojis": true,
                  "transformStickers": true,
                  "transformCompoundSentence": false
              },
              "FakeProfileThemes": {
                  "enabled": false
              },
              "FavoriteEmojiFirst": {
                  "enabled": false
              },
              "FavoriteGifSearch": {
                  "enabled": false
              },
              "FixCodeblockGap": {
                  "enabled": false
              },
              "FixImagesQuality": {
                  "enabled": false
              },
              "FixSpotifyEmbeds": {
                  "enabled": false
              },
              "FixYoutubeEmbeds": {
                  "enabled": false
              },
              "ForceOwnerCrown": {
                  "enabled": false
              },
              "FriendInvites": {
                  "enabled": false
              },
              "FriendsSince": {
                  "enabled": false
              },
              "FullSearchContext": {
                  "enabled": false
              },
              "GameActivityToggle": {
                  "enabled": true,
                  "oldIcon": false
              },
              "GifPaste": {
                  "enabled": false
              },
              "GreetStickerPicker": {
                  "enabled": false
              },
              "iLoveSpam": {
                  "enabled": false
              },
              "IgnoreActivities": {
                  "enabled": false
              },
              "ImageLink": {
                  "enabled": false
              },
              "ImageZoom": {
                  "enabled": true,
                  "size": 100,
                  "zoom": 2,
                  "saveZoomValues": true,
                  "nearestNeighbour": false,
                  "square": false
              },
              "ImplicitRelationships": {
                  "enabled": false
              },
              "InvisibleChat": {
                  "enabled": false
              },
              "KeepCurrentChannel": {
                  "enabled": false
              },
              "LastFMRichPresence": {
                  "enabled": false
              },
              "LoadingQuotes": {
                  "enabled": false
              },
              "MemberCount": {
                  "enabled": false
              },
              "MentionAvatars": {
                  "enabled": false
              },
              "MessageClickActions": {
                  "enabled": false
              },
              "MessageLatency": {
                  "enabled": false
              },
              "MessageLinkEmbeds": {
                  "enabled": false
              },
              "MessageLogger": {
                  "enabled": true,
                  "collapseDeleted": false,
                  "deleteStyle": "text",
                  "ignoreBots": false,
                  "ignoreSelf": false,
                  "ignoreUsers": "",
                  "ignoreChannels": "",
                  "ignoreGuilds": "",
                  "logEdits": true,
                  "logDeletes": true,
                  "inlineEdits": true
              },
              "MessageTags": {
                  "enabled": false
              },
              "MoreCommands": {
                  "enabled": false
              },
              "MoreKaomoji": {
                  "enabled": false
              },
              "MoreUserTags": {
                  "enabled": false
              },
              "Moyai": {
                  "enabled": false
              },
              "MutualGroupDMs": {
                  "enabled": false
              },
              "NewGuildSettings": {
                  "enabled": true,
                  "guild": true,
                  "everyone": true,
                  "role": true,
                  "events": true,
                  "highlights": true,
                  "messages": 3,
                  "showAllChannels": true
              },
              "NoBlockedMessages": {
                  "enabled": false
              },
              "NoDevtoolsWarning": {
                  "enabled": false
              },
              "NoF1": {
                  "enabled": true
              },
              "NoMaskedUrlPaste": {
                  "enabled": false
              },
              "NoMosaic": {
                  "enabled": false
              },
              "NoOnboardingDelay": {
                  "enabled": false
              },
              "NoPendingCount": {
                  "enabled": false
              },
              "NoProfileThemes": {
                  "enabled": false
              },
              "NoReplyMention": {
                  "enabled": false
              },
              "NoScreensharePreview": {
                  "enabled": false
              },
              "NoServerEmojis": {
                  "enabled": false
              },
              "NoTypingAnimation": {
                  "enabled": false
              },
              "NoUnblockToJump": {
                  "enabled": false
              },
              "NormalizeMessageLinks": {
                  "enabled": false
              },
              "NotificationVolume": {
                  "enabled": false
              },
              "NSFWGateBypass": {
                  "enabled": true
              },
              "OnePingPerDM": {
                  "enabled": false
              },
              "oneko": {
                  "enabled": false
              },
              "OpenInApp": {
                  "enabled": true,
                  "spotify": true,
                  "steam": true,
                  "epic": true,
                  "tidal": true,
                  "itunes": true
              },
              "OverrideForumDefaults": {
                  "enabled": false
              },
              "PartyMode": {
                  "enabled": false
              },
              "PauseInvitesForever": {
                  "enabled": false
              },
              "PermissionFreeWill": {
                  "enabled": false
              },
              "PermissionsViewer": {
                  "enabled": false
              },
              "petpet": {
                  "enabled": false
              },
              "PictureInPicture": {
                  "enabled": false
              },
              "PinDMs": {
                  "enabled": false
              },
              "PlainFolderIcon": {
                  "enabled": true
              },
              "PlatformIndicators": {
                  "enabled": false
              },
              "PreviewMessage": {
                  "enabled": false
              },
              "QuickMention": {
                  "enabled": false
              },
              "QuickReply": {
                  "enabled": false
              },
              "ReactErrorDecoder": {
                  "enabled": false
              },
              "ReadAllNotificationsButton": {
                  "enabled": true
              },
              "RelationshipNotifier": {
                  "enabled": false
              },
              "ReplaceGoogleSearch": {
                  "enabled": false
              },
              "ReplyTimestamp": {
                  "enabled": false
              },
              "RevealAllSpoilers": {
                  "enabled": false
              },
              "ReverseImageSearch": {
                  "enabled": false
              },
              "ReviewDB": {
                  "enabled": false
              },
              "RoleColorEverywhere": {
                  "enabled": false
              },
              "SecretRingToneEnabler": {
                  "enabled": false
              },
              "Summaries": {
                  "enabled": false
              },
              "SendTimestamps": {
                  "enabled": false
              },
              "ServerInfo": {
                  "enabled": false
              },
              "ServerListIndicators": {
                  "enabled": false
              },
              "ShikiCodeblocks": {
                  "enabled": false
              },
              "ShowAllMessageButtons": {
                  "enabled": false
              },
              "ShowConnections": {
                  "enabled": false
              },
              "ShowHiddenChannels": {
                  "enabled": false,
                  "showMode": 0,
                  "hideUnreads": true,
                  "defaultAllowedUsersAndRolesDropdownState": true
              },
              "ShowHiddenThings": {
                  "enabled": true,
                  "showTimeouts": true,
                  "showInvitesPaused": true,
                  "showModView": true,
                  "disableDiscoveryFilters": true,
                  "disableDisallowedDiscoveryFilters": true
              },
              "ShowMeYourName": {
                  "enabled": false
              },
              "ShowTimeoutDuration": {
                  "enabled": false
              },
              "SilentMessageToggle": {
                  "enabled": false
              },
              "SilentTyping": {
                  "enabled": true,
                  "isEnabled": true,
                  "showIcon": false
              },
              "SortFriendRequests": {
                  "enabled": false
              },
              "SpotifyControls": {
                  "enabled": false
              },
              "SpotifyCrack": {
                  "enabled": false,
                  "noSpotifyAutoPause": true,
                  "keepSpotifyActivityOnIdle": false
              },
              "SpotifyShareCommands": {
                  "enabled": false
              },
              "StartupTimings": {
                  "enabled": false
              },
              "StickerPaste": {
                  "enabled": false
              },
              "StreamerModeOnStream": {
                  "enabled": false
              },
              "SuperReactionTweaks": {
                  "enabled": false
              },
              "TextReplace": {
                  "enabled": false
              },
              "ThemeAttributes": {
                  "enabled": false
              },
              "Translate": {
                  "enabled": false
              },
              "TypingIndicator": {
                  "enabled": false
              },
              "TypingTweaks": {
                  "enabled": false
              },
              "Unindent": {
                  "enabled": false
              },
              "UnlockedAvatarZoom": {
                  "enabled": false
              },
              "UnsuppressEmbeds": {
                  "enabled": false
              },
              "UserMessagesPronouns": {
                  "enabled": false
              },
              "UserVoiceShow": {
                  "enabled": false
              },
              "USRBG": {
                  "enabled": false
              },
              "ValidReply": {
                  "enabled": false
              },
              "ValidUser": {
                  "enabled": false
              },
              "VoiceChatDoubleClick": {
                  "enabled": false
              },
              "VcNarrator": {
                  "enabled": false
              },
              "VencordToolbox": {
                  "enabled": false
              },
              "ViewIcons": {
                  "enabled": true
              },
              "ViewRaw": {
                  "enabled": false
              },
              "VoiceDownload": {
                  "enabled": false
              },
              "VoiceMessages": {
                  "enabled": false
              },
              "VolumeBooster": {
                  "enabled": false
              },
              "WebKeybinds": {
                  "enabled": true
              },
              "WebScreenShareFixes": {
                  "enabled": true
              },
              "WhoReacted": {
                  "enabled": false
              },
              "XSOverlay": {
                  "enabled": false
              },
              "YoutubeAdblock": {
                  "enabled": true
              },
              "NoTrack": {
                  "enabled": true,
                  "disableAnalytics": true
              },
              "WebContextMenus": {
                  "enabled": true,
                  "addBack": true
              },
              "Settings": {
                  "enabled": true,
                  "settingsLocation": "aboveNitro"
              },
              "SupportHelper": {
                  "enabled": true
              },
              "FullUserInChatbox": {
                  "enabled": false
              },
              "IrcColors": {
                  "enabled": false
              },
              "BadgeAPI": {
                  "enabled": true
              },
              "HideMedia": {
                  "enabled": false
              }
          },
          "notifications": {
              "timeout": 5000,
              "position": "bottom-right",
              "useNative": "not-focused",
              "logLimit": 50
          },
          "cloud": {
              "authenticated": false,
              "url": "https://api.vencord.dev/",
              "settingsSync": false,
              "settingsSyncVersion": 1742180703594
          },
          "notifyAboutUpdates": true,
          "eagerPatches": false
      }
    '';
  };
}
