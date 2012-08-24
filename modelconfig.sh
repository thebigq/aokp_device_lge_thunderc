#!/bin/sh

MODEL_SPECIFIC_FILES="
	system/build.prop
	system/framework/framework-res.apk
	system/app/Mms.apk
	system/lib/libcm.so
	system/lib/libsnd.so
	system/lib/libril-qc-1.so
	system/lib/libril-qcril-hook-oem.so
	system/lib/libril.so
	system/lib/libnv.so
	system/bin/ami304d
	system/bin/rild"

PRODUCT_REMOVE_FILES=""

# DRM blobs (vendor/aokp commit e709b1c5af95fd4d87837bed23b8a1e8594dbc6b)
# Note property drm.service.enabled should not be set but seems harmless
PRODUCT_REMOVE_FILES="$PRODUCT_REMOVE_FILES
	system/etc/permissions/com.google.widevine.software.drm.xml
	system/framework/com.google.widevine.software.drm.jar
	system/lib/libfrsdk.so
	system/lib/libWVphoneAPI.so
	system/vendor/lib/libwvdrm_L1.so
	system/vendor/lib/libwvm.so
	system/vendor/lib/libWVStreamControlAPI_L1.so
	system/vendor/lib/drm/libdrmwvmplugin.so"

# PicoTTS
PRODUCT_REMOVE_FILES="$PRODUCT_REMOVE_FILES
	system/tts/lang_pico/de-DE_gl0_sg.bin
	system/tts/lang_pico/de-DE_ta.bin
	system/tts/lang_pico/en-GB_kh0_sg.bin
	system/tts/lang_pico/en-GB_ta.bin
	system/tts/lang_pico/fr-FR_nk0_sg.bin
	system/tts/lang_pico/fr-FR_ta.bin
	system/tts/lang_pico/it-IT_cm0_sg.bin
	system/tts/lang_pico/it-IT_ta.bin"

# Wallpapers and Media
PRODUCT_REMOVE_FILES="$PRODUCT_REMOVE_FILES
	system/app/LiveWallpapers.apk
	system/app/MagicSmokeWallpapers.apk
	system/app/PhaseBeam.apk
	system/app/SwagPapers.apk
	system/app/VisualizationWallpapers.apk
	system/media/audio/alarms/Nobelium.ogg
	system/media/audio/alarms/Plutonium.ogg
	system/media/audio/ringtones/FreeFlight.ogg
	system/media/audio/ringtones/Perseus.ogg
	system/media/audio/ringtones/Scarabaeus.ogg
	system/media/audio/ringtones/Sceptrum.ogg
	system/media/audio/ringtones/Themos.ogg
	system/media/audio/ringtones/UrsaMinor.ogg
	system/media/video/AndroidInSpace.240p.mp4
	system/media/video/AndroidInSpace.480p.mp4
	system/media/video/Disco.240p.mp4
	system/media/video/Disco.480p.mp4
	system/media/video/Sunset.240p.mp4
	system/media/video/Sunset.480p.mp4"

# Other
PRODUCT_REMOVE_FILES="$PRODUCT_REMOVE_FILES
	system/app/VideoEditor.apk"

# system/lib/libvideoeditor_jni.so
# system/lib/libvideoeditorplayer.so

PRODUCT_REMOVE_RES="{layout,drawable,mipmap,menu,xml}-{large,sw580,sw600,sw768,xhdpi,xlarge}*"

# Keep only en, es
PACKAGE_REMOVE_FILES="
	LatinIME.apk:res/{raw,xml}-{ar,bg,cs,cs-ZZ,da,de,de-ZZ,el,fa,fi,fr,fr-CA,fr-CH,hr,hr-AL,hu,hu-ZZ,it,iw,ka,nb,nl,nl-BE,pl,pt,ru,sr,sv,tr}"
