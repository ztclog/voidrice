var plasma = getApiVersion(1);

var layout = {
    "desktops": [
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "ItemGeometries-1200x800": "",
                    "ItemGeometries-1422x800": "",
                    "ItemGeometries-2048x1152": "",
                    "ItemGeometries-2560x1440": "",
                    "ItemGeometriesHorizontal": "",
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.potd"
                },
                "/ConfigDialog": {
                    "DialogHeight": "778",
                    "DialogWidth": "1205"
                },
                "/General": {
                    "locked": "true",
                    "positions": "{\"2560x1440\":[]}",
                    "sortMode": "6"
                },
                "/Wallpaper/com.github.zzag.dynamic/General": {
                    "Image": "file:///usr/share/wallpapers/Dynamic/contents/images/dynamic.avif"
                },
                "/Wallpaper/org.kde.image/General": {
                    "Image": "file:///usr/share/wallpapers/Mountain/",
                    "SlidePaths": "/home/ztclog/.local/share/wallpapers/,/usr/share/wallpapers/"
                },
                "/Wallpaper/org.kde.potd/General": {
                    "FillMode": "2",
                    "Provider": "flickr",
                    "UpdateOverMeteredConnection": "1"
                }
            },
            "wallpaperPlugin": "org.kde.potd"
        },
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "ItemGeometries-1440x960": "",
                    "ItemGeometriesHorizontal": "",
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "1",
                    "wallpaperplugin": "org.kde.potd"
                },
                "/ConfigDialog": {
                    "DialogHeight": "630",
                    "DialogWidth": "810"
                },
                "/Wallpaper/org.kde.potd/General": {
                    "FillMode": "2",
                    "Provider": "flickr",
                    "UpdateOverMeteredConnection": "1"
                }
            },
            "wallpaperPlugin": "org.kde.potd"
        }
    ],
    "panels": [
        {
            "alignment": "center",
            "applets": [
                {
                    "config": {
                        "/Appearance": {
                            "fillThickness": "true",
                            "fontSize": "15"
                        },
                        "/Behavior": {
                            "showTooltip": "false"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "1416",
                            "DialogWidth": "2560"
                        }
                    },
                    "plugin": "org.kde.windowtitle"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                        "/": {
                            "popupHeight": "400",
                            "popupWidth": "560"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "540",
                            "DialogWidth": "720"
                        }
                    },
                    "plugin": "org.kde.plasma.appmenu"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "90",
                            "popupHeight": "451",
                            "popupWidth": "810"
                        },
                        "/Appearance": {
                            "autoFontAndSize": "false",
                            "boldText": "true",
                            "dateDisplayFormat": "BesideTime",
                            "dateFormat": "longDate",
                            "enabledCalendarPlugins": "alternatecalendar,astronomicalevents",
                            "fontFamily": "Adwaita Sans",
                            "fontSize": "20",
                            "fontStyleName": "SemiBold",
                            "fontWeight": "600",
                            "showDate": "false",
                            "showWeekNumbers": "true"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "578",
                            "DialogWidth": "720"
                        }
                    },
                    "plugin": "org.kde.plasma.digitalclock"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/Advanced": {
                            "interfacesWhitelist": "enp0s20f0u4",
                            "interfacesWhitelistEnabled": "true"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "540",
                            "DialogWidth": "720"
                        },
                        "/General": {
                            "customColors": "true",
                            "fontSize": "80",
                            "shortUnits": "true",
                            "speedLayout": "columns"
                        }
                    },
                    "plugin": "org.kde.netspeedWidget"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.systemtray"
                },
                {
                    "config": {
                        "/ConfigDialog": {
                            "DialogHeight": "684",
                            "DialogWidth": "763"
                        },
                        "/General": {
                            "buttons": "3|4|5|10|2|9",
                            "containmentType": "Plasma",
                            "selectedPlugin": "org.kde.oxygen",
                            "useCurrentDecoration": "false",
                            "visibility": "ActiveMaximizedWindow"
                        }
                    },
                    "plugin": "org.kde.windowbuttons"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                }
            },
            "height": 2.2222222222222223,
            "hiding": "normal",
            "location": "top",
            "maximumLength": 113.77777777777777,
            "minimumLength": 113.77777777777777,
            "offset": 0
        },
        {
            "alignment": "center",
            "applets": [
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "100",
                            "popupHeight": "647",
                            "popupWidth": "927"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "540",
                            "DialogWidth": "720"
                        },
                        "/General": {
                            "favoritesPortedToKAstats": "true",
                            "icon": "/usr/share/pixmaps/archlinux-logo.png",
                            "showRecentApps": "false",
                            "showRecentDocs": "false",
                            "systemFavorites": "suspend\\,hibernate\\,reboot\\,shutdown"
                        }
                    },
                    "plugin": "org.kde.plasma.kickoff"
                },
                {
                    "config": {
                        "/ConfigDialog": {
                            "DialogHeight": "540",
                            "DialogWidth": "720"
                        },
                        "/General": {
                            "launchers": "preferred://browser,applications:foot.desktop,preferred://filemanager"
                        }
                    },
                    "plugin": "org.kde.plasma.icontasks"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                }
            },
            "height": 4.222222222222222,
            "hiding": "dodgewindows",
            "location": "bottom",
            "maximumLength": 113.77777777777777,
            "minimumLength": 113.77777777777777,
            "offset": 0
        },
        {
            "applets": [
                {
                    "config": {
                        "/Appearance": {
                            "fillThickness": "true",
                            "fontSize": "15"
                        },
                        "/Behavior": {
                            "showTooltip": "false"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "1416",
                            "DialogWidth": "2560"
                        }
                    },
                    "plugin": "org.kde.windowtitle"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                        "/": {
                            "popupHeight": "400",
                            "popupWidth": "560"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "540",
                            "DialogWidth": "720"
                        }
                    },
                    "plugin": "org.kde.plasma.appmenu"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "90",
                            "popupHeight": "451",
                            "popupWidth": "810"
                        },
                        "/Appearance": {
                            "autoFontAndSize": "false",
                            "boldText": "true",
                            "dateDisplayFormat": "BesideTime",
                            "dateFormat": "longDate",
                            "enabledCalendarPlugins": "alternatecalendar,astronomicalevents",
                            "fontFamily": "Adwaita Sans",
                            "fontSize": "20",
                            "fontStyleName": "SemiBold",
                            "fontWeight": "600",
                            "showDate": "false",
                            "showWeekNumbers": "true"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "578",
                            "DialogWidth": "720"
                        }
                    },
                    "plugin": "org.kde.plasma.digitalclock"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/Advanced": {
                            "interfacesWhitelist": "enp0s20f0u4",
                            "interfacesWhitelistEnabled": "true"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "540",
                            "DialogWidth": "720"
                        },
                        "/General": {
                            "customColors": "true",
                            "fontSize": "80",
                            "shortUnits": "true",
                            "speedLayout": "columns"
                        }
                    },
                    "plugin": "org.kde.netspeedWidget"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.systemtray"
                },
                {
                    "config": {
                        "/ConfigDialog": {
                            "DialogHeight": "684",
                            "DialogWidth": "763"
                        },
                        "/General": {
                            "buttons": "3|4|5|10|2|9",
                            "containmentType": "Plasma",
                            "selectedPlugin": "org.kde.oxygen",
                            "useCurrentDecoration": "false",
                            "visibility": "ActiveMaximizedWindow"
                        }
                    },
                    "plugin": "org.kde.windowbuttons"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "1",
                    "wallpaperplugin": "org.kde.image"
                }
            },
            "height": 4,
            "location": "top"
        }
    ],
    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
