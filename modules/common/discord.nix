{pkgs, ...}: {
  home.packages = [
    pkgs.vesktop
  ];

  home.file.".config/vesktop/themes/deishuu.css".text = ''
    /**
     * @name midnight deishuu's dotfiles
     * @description A dark, rounded discord theme generated with home manager.
     * @author refact0r, anubis
     * @version 1.6.2
     * @source https://github.com/refact0r/midnight-discord/blob/master/flavors/midnight-nord.theme.css
     * @authorId 508863359777505290
     * @authorLink https://www.refact0r.dev
    */

    /* IMPORTANT: make sure to enable dark mode in discord settings for the theme to apply properly!!! */

    @import url('https://refact0r.github.io/midnight-discord/midnight.css');

    /* customize things here */
    :root {
    	/* font, change to 'gg sans' for default discord font */
    	--font: 'figtree';

    	/* top left corner text */
    	--corner-text: 'Nord';

    	/* thickness of messages divider */
    	--divider-thickness: 3px;

    	/* color of status indicators and window controls */
    	--online-indicator: #a3be8c; /* change to #23a55a for default green */
    	--dnd-indicator: #bf616a; /* change to #f23f43 for default red */
    	--idle-indicator: #ebcb8b; /* change to #f0b232 for default yellow */
    	--streaming-indicator: #b48ead; /* change to #593695 for default purple */

    	/* accent colors */
    	--accent-1: hsl(179, 25%, 65%); /* links */
    	--accent-2: hsl(193, 43%, 67%); /* general unread/mention elements */
    	--accent-3: hsl(193, 43%, 67%); /* accent buttons */
    	--accent-4: hsl(193, 37%, 60%); /* accent buttons when hovered */
    	--accent-5: hsl(193, 31%, 53%); /* accent buttons when clicked */
    	--mention: hsla(193, 43%, 51%, 0.1); /* mentions & mention messages */
    	--mention-hover: hsla(193, 43%, 51%, 0.05); /* mentions & mention messages when hovered */

    	/* text colors */
    	--text-0: #2e3440; /* text on colored elements */
    	--text-1: #eceff4; /* other normally white text */
    	--text-2: #e5e9f0; /* headings and important text */
    	--text-3: #eceff4; /* normal text */
    	--text-4: #93a4c2; /* icon buttons and channels */
    	--text-5: #434c5e; /* muted channels/chats and timestamps */

    	/* background and dark colors */
    	--bg-1: #434c5e; /* dark buttons when clicked */
    	--bg-2: #3b4252; /* dark buttons */
    	--bg-3: #2e3440; /* spacing, secondary elements */
    	--bg-4: #272b35; /* main background color */
    	--hover: hsla(220, 17%, 32%, 0.3); /* buttons when hovered */
    	--active: hsla(220, 17%, 32%, 0.5); /* channels and buttons when clicked or selected */
    	--message-hover: hsla(0, 0%, 0%, 0.1); /* messages when hovered */

    	/* amount of spacing and padding */
    	--spacing: 12px;

    	/* animations */
    	/* ALL ANIMATIONS CAN BE DISABLED WITH REDUCED MOTION IN DISCORD SETTINGS */
    	--list-item-transition: 0.2s ease; /* channels/members/settings hover transition */
    	--unread-bar-transition: 0.2s ease; /* unread bar moving into view transition */
    	--moon-spin-transition: 0.4s ease; /* moon icon spin */
    	--icon-spin-transition: 1s ease; /* round icon button spin (settings, emoji, etc.) */

    	/* corner roundness (border-radius) */
    	--roundness-xl: 22px; /* roundness of big panel outer corners */
    	--roundness-l: 20px; /* popout panels */
    	--roundness-m: 16px; /* smaller panels, images, embeds */
    	--roundness-s: 12px; /* members, settings inputs */
    	--roundness-xs: 10px; /* channels, buttons */
    	--roundness-xxs: 8px; /* searchbar, small elements */

    	/* direct messages moon icon */
    	/* change to block to show, none to hide */
    	--discord-icon: none; /* discord icon */
    	--moon-icon: block; /* moon icon */
    	--moon-icon-url: url('https://upload.wikimedia.org/wikipedia/commons/c/c4/Font_Awesome_5_solid_moon.svg'); /* custom icon url */
    	--moon-icon-size: auto;

    	/* filter uncolorable elements to fit theme */
    	/* (just set to none, they're too much work to configure) */
    	--login-bg-filter: none; /* login background artwork */
    	--green-to-accent-3-filter: none; /* add friend page explore icon */
    	--blurple-to-accent-3-filter: none; /* add friend page school icon */

    	/* choose style for window control buttons (minimize-maximize-close) */
    	/* block to show, none to hide; choose only one to show!*/
    	--windows-nav: none; /* default windows-style buttons */
    	--custom-nav: block; /* custom mac-style buttons */
    }
  '';
  home.file.".config/vesktop/settings/settings.json".text = ''
    {
      "autoUpdate": true,
      "autoUpdateNotification": true,
      "useQuickCss": true,
      "themeLinks": [],
      "eagerPatches": false,
      "enabledThemes": ["deishuu.css"],
      "enableReactDevtools": false,
      "frameless": false,
      "transparent": false,
      "winCtrlQ": false,
      "disableMinSize": false,
      "winNativeTitleBar": false,
      "plugins": {
        "ChatInputButtonAPI": {
          "enabled": false
        },
        "CommandsAPI": {
          "enabled": true
        },
        "DynamicImageModalAPI": {
          "enabled": false
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
          "enabled": false
        },
        "MessagePopoverAPI": {
          "enabled": false
        },
        "MessageUpdaterAPI": {
          "enabled": false
        },
        "ServerListAPI": {
          "enabled": false
        },
        "UserSettingsAPI": {
          "enabled": true
        },
        "AccountPanelServerProfile": {
          "enabled": false
        },
        "AlwaysAnimate": {
          "enabled": false
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
          "enabled": false
        },
        "BlurNSFW": {
          "enabled": false
        },
        "CallTimer": {
          "enabled": false
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
          "enabled": false
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
        "FullUserInChatbox": {
          "enabled": false
        },
        "GameActivityToggle": {
          "enabled": false
        },
        "GifPaste": {
          "enabled": false
        },
        "GreetStickerPicker": {
          "enabled": false
        },
        "HideMedia": {
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
          "enabled": false
        },
        "ImplicitRelationships": {
          "enabled": false
        },
        "InvisibleChat": {
          "enabled": false
        },
        "IrcColors": {
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
          "enabled": false
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
        "Moyai": {
          "enabled": false
        },
        "MutualGroupDMs": {
          "enabled": false
        },
        "NewGuildSettings": {
          "enabled": false
        },
        "NoBlockedMessages": {
          "enabled": false
        },
        "NoDevtoolsWarning": {
          "enabled": false
        },
        "NoF1": {
          "enabled": false
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
          "enabled": false
        },
        "OnePingPerDM": {
          "enabled": false
        },
        "oneko": {
          "enabled": false
        },
        "OpenInApp": {
          "enabled": false
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
          "enabled": false
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
          "enabled": false
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
          "enabled": false
        },
        "ShowHiddenThings": {
          "enabled": false
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
          "enabled": false
        },
        "SortFriendRequests": {
          "enabled": false
        },
        "SpotifyControls": {
          "enabled": false
        },
        "SpotifyCrack": {
          "enabled": false
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
          "enabled": false
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
          "enabled": false
        },
        "BadgeAPI": {
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
      }
    }
  '';
}
