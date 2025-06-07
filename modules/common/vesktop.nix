{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = [
    pkgs.vesktop
  ];

  home.file = let
    vesktopPath =
      if pkgs.stdenv.isDarwin
      then "Library/Application Support/vesktop/"
      else ".config/vesktop";
  in {
    "${vesktopPath}/themes/deishuu.css".text = ''
      /**
       * @name deishuu's theme
       * @description I customized this theme for personal use, based on the Midnight theme.
       * @author refact0r
       * @version 2.0.1
       * @source https://github.com/refact0r/midnight-discord/blob/master/themes/midnight.theme.css
       * @authorId 508863359777505290
       * @authorLink https://www.refact0r.dev
       */

      /* import theme modules */
      @import url('https://refact0r.github.io/midnight-discord/build/midnight.css');

      body {
        --font: '${config.font}';

        /* sizes */
        --gap: 12px;
        --divider-thickness: 4px;

        /* animation/transition options */
        --animations: on;
        --list-item-transition: 0.2s ease;
        --dms-icon-svg-transition: 0.4s ease;

        /* top bar options */
        --move-top-bar-buttons: off;
        --custom-app-top-bar-height: 32px;

        /* window controls */
        --custom-window-controls: on;
        --window-control-size: 14px;

        /* dms button icon options */
        --dms-icon: on;
        --dms-icon-svg-url: url('https://i.imgur.com/MuwiDQY.png');
        --dms-icon-svg-size: 90%;
        --dms-icon-color-before: var(--icon-secondary);
        --dms-icon-color-after: var(--white);

        /* dms button background options */
        --dms-background: off;
        --dms-background-image-size: cover;
        --dms-background-color: linear-gradient(70deg, var(--blue-2), var(--purple-2), var(--red-2));

        /* background image options */
        --background-image: off;

        /* transparency/blur options */
        --transparency-tweaks: off;
        --remove-bg-layer: off;
        --panel-blur: off;
        --blur-amount: 12px;
        --bg-floating: var(--bg-3);

        /* chatbar options */
        --flipped-chatbar: on;
        --chatbar-height: 47px;
        --chatbar-padding: 8px;

        /* other options */
        --small-user-panel: off;
      }

      :root {
        --colors: on;

        /* text colors */
        --text-0: #d9e0ee;
        --text-1: #d9e0ee;
        --text-2: #d9e0ee;
        --text-3: #d9e0ee;
        --text-4: #d9e0ee;
        --text-5: #d9e0ee;

        /* background and dark colors */
        --bg-1: #1F1F1F;
        --bg-2: #1F1F1F;
        --bg-3: #1F1F1F;
        --bg-4: #1F1F1F;
        --hover: hsla(221, 19%, 40%, 0.1);
        --active: hsla(220, 19%, 40%, 0.2);
        --active-2: hsla(220, 19%, 40%, 0.3);
        --message-hover: hsla(220, 0%, 0%, 0.1);

        /* accent colors */
        --accent-1: var(--blue-1);
        --accent-2: var(--blue-2);
        --accent-3: var(--blue-3);
        --accent-4: var(--blue-4);
        --accent-5: var(--blue-5);
        --accent-new: var(--accent-2);
        --mention: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 90%) 40%, transparent);
        --mention-hover: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 95%) 40%, transparent);
        --reply: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 90%) 40%, transparent);
        --reply-hover: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 95%) 40%, transparent);

        /* status indicator colors */
        --online: var(--green-2);
        --dnd: var(--red-2);
        --idle: var(--yellow-2);
        --streaming: var(--purple-2);
        --offline: var(--text-4);

        /* border colors */
        --border-light: var(--hover);
        --border: var(--active);
        --button-border: hsl(220, 0%, 100%, 0.1);

        /* base colors */
        --red-1: oklch(76% 0.12 0);
        --red-2: oklch(70% 0.12 0);
        --red-3: oklch(64% 0.12 0);
        --red-4: oklch(58% 0.12 0);
        --red-5: oklch(52% 0.12 0);

        --green-1: oklch(76% 0.11 170);
        --green-2: oklch(70% 0.11 170);
        --green-3: oklch(64% 0.11 170);
        --green-4: oklch(58% 0.11 170);
        --green-5: oklch(52% 0.11 160);

        --blue-1: oklch(76% 0.1 215);
        --blue-2: oklch(70% 0.1 215);
        --blue-3: oklch(64% 0.1 215);
        --blue-4: oklch(58% 0.1 215);
        --blue-5: oklch(52% 0.1 215);

        --yellow-1: oklch(80% 0.11 90);
        --yellow-2: oklch(74% 0.11 90);
        --yellow-3: oklch(68% 0.11 90);
        --yellow-4: oklch(62% 0.11 90);
        --yellow-5: oklch(56% 0.11 90);

        --purple-1: oklch(76% 0.11 310);
        --purple-2: oklch(70% 0.11 310);
        --purple-3: oklch(64% 0.11 310);
        --purple-4: oklch(58% 0.11 310);
        --purple-5: oklch(52% 0.11 310);
      }
    '';
    "${vesktopPath}/settings/settings.json".text = ''
      {
          "autoUpdate": true,
          "autoUpdateNotification": true,
          "useQuickCss": true,
          "themeLinks": [],
          "eagerPatches": false,
          "enabledThemes": [
              "deishuu.css"
          ],
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
                  "enabled": false
              },
              "UserSettingsAPI": {
                  "enabled": true
              },
              "AccountPanelServerProfile": {
                  "enabled": false,
                  "prioritizeServerProfile": false
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
                  "enabled": false
              },
              "BetterGifAltText": {
                  "enabled": false
              },
              "BetterGifPicker": {
                  "enabled": true
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
                  "enabled": true
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
                  "enabled": true
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
                  "enableEmojiBypass": true,
                  "emojiSize": 48,
                  "transformEmojis": true,
                  "enableStickerBypass": true,
                  "stickerSize": 160,
                  "transformStickers": true,
                  "transformCompoundSentence": false,
                  "enableStreamQualityBypass": true,
                  "useHyperLinks": true,
                  "hyperLinkText": "{{NAME}}",
                  "disableEmbedPermissionCheck": false
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
                  "enabled": true
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
                  "enabled": true
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
                  "enabled": true
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
                  "enabled": true
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
                  "enabled": false
              },
              "BadgeAPI": {
                  "enabled": true
              },
              "NoTrack": {
                  "enabled": true,
                  "disableAnalytics": true
              },
              "Settings": {
                  "enabled": true,
                  "settingsLocation": "aboveNitro"
              },
              "DisableDeepLinks": {
                  "enabled": true
              },
              "SupportHelper": {
                  "enabled": true
              },
              "WebContextMenus": {
                  "enabled": true
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
              "settingsSyncVersion": 1743869530820
          }
      }


    '';
  };
}
