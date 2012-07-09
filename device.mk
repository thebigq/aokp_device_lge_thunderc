PRODUCT_AAPT_CONFIG := normal mdpi 
PRODUCT_AAPT_PREF_CONFIG := mdpi 

PRODUCT_LOCALES := en_US es_ES

BOOTIMAGES := $(wildcard device/lge/thunderc-common/bootimages/*.rle)

# Don't want boot images or charger images in recovery.
# They are not needed and they exceed the VS660 recovery size.
RECOVERY_REMOVE_FILES := bootimages chargerimages

# DRM blobs (vendor/aokp commit e709b1c5af95fd4d87837bed23b8a1e8594dbc6b)
# Note property drm.service.enabled should not be set but seems harmless
PRODUCT_REMOVE_FILES += \
	system/etc/permissions/com.google.widevine.software.drm.xml \
	system/framework/com.google.widevine.software.drm.jar \
	system/lib/libfrsdk.so \
	system/lib/libWVphoneAPI.so \
	system/vendor/lib/libwvdrm_L1.so \
	system/vendor/lib/libwvm.so \
	system/vendor/lib/libWVStreamControlAPI_L1.so \
	system/vendor/lib/drm/libdrmwvmplugin.so

# PicoTTS
PRODUCT_REMOVE_FILES += \
	system/tts/lang_pico/de-DE_gl0_sg.bin \
	system/tts/lang_pico/de-DE_ta.bin \
	system/tts/lang_pico/en-GB_kh0_sg.bin \
	system/tts/lang_pico/en-GB_ta.bin \
	system/tts/lang_pico/fr-FR_nk0_sg.bin \
	system/tts/lang_pico/fr-FR_ta.bin \
	system/tts/lang_pico/it-IT_cm0_sg.bin \
	system/tts/lang_pico/it-IT_ta.bin

# Wallpapers and Media
PRODUCT_REMOVE_FILES += \
	system/app/LiveWallpapers.apk \
	system/app/MagicSmokeWallpapers.apk \
	system/app/PhaseBeam.apk \
	system/app/SwagPapers.apk \
	system/app/VisualizationWallpapers.apk \
	system/media/audio/alarms/Nobelium.ogg \
	system/media/audio/alarms/Nobelium.ogg \
	system/media/audio/alarms/Plutonium.ogg \
	system/media/audio/alarms/Plutonium.ogg \
	system/media/audio/ringtones/FreeFlight.ogg \
	system/media/audio/ringtones/FreeFlight.ogg \
	system/media/audio/ringtones/Perseus.ogg \
	system/media/audio/ringtones/Perseus.ogg \
	system/media/audio/ringtones/Scarabaeus.ogg \
	system/media/audio/ringtones/Scarabaeus.ogg \
	system/media/audio/ringtones/Sceptrum.ogg \
	system/media/audio/ringtones/Sceptrum.ogg \
	system/media/audio/ringtones/Themos.ogg \
	system/media/audio/ringtones/Themos.ogg \
	system/media/audio/ringtones/UrsaMinor.ogg \
	system/media/audio/ringtones/UrsaMinor.ogg \
	system/media/video/AndroidInSpace.240p.mp4 \
	system/media/video/AndroidInSpace.480p.mp4 \
	system/media/video/Disco.240p.mp4 \
	system/media/video/Disco.480p.mp4 \
	system/media/video/Sunset.240p.mp4 \
	system/media/video/Sunset.480p.mp4

# Other
PRODUCT_REMOVE_FILES += \
	system/app/VideoEditor.apk \
#	system/lib/libvideoeditor_jni.so \
#	system/lib/libvideoeditorplayer.so

DEVICE_PACKAGE_OVERLAYS += device/lge/thunderc-common/overlay

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Use dalvik parameters for a 512 MB device
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

# Custom bootlogo
PRODUCT_COPY_FILES += \
    $(foreach f,$(BOOTIMAGES),$f:root/bootimages/$(notdir $f))

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_COPY_FILES += \
    device/lge/thunderc-common/init.rc:root/init.rc \
    device/lge/thunderc-common/prebuilt/initlogo.rle:root/initlogo.rle \
    device/lge/thunderc-common/prebuilt/init.qcom.sh:root/init.qcom.sh \
#    device/lge/thunderc-common/prebuilt/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

# BT startup
PRODUCT_COPY_FILES += device/lge/thunderc-common/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

# configs
PRODUCT_COPY_FILES += device/lge/thunderc-common/configs/AudioFilter.csv:system/etc/AudioFilter.csv
PRODUCT_COPY_FILES += device/lge/thunderc-common/configs/thunderc_keypad.kl:system/usr/keylayout/thunderc_keypad.kl
PRODUCT_COPY_FILES += device/lge/thunderc-common/configs/thunderc_keypad.kcm.bin:system/usr/keychars/thunderc_keypad.kcm.bin
PRODUCT_COPY_FILES += device/lge/thunderc-common/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl
PRODUCT_COPY_FILES += device/lge/thunderc-common/configs/Generic.kl:system/usr/keylayout/Generic.kl
PRODUCT_COPY_FILES += device/lge/thunderc-common/configs/adreno_config.txt:system/etc/adreno_config.txt
#PRODUCT_COPY_FILES += device/lge/thunderc-common/configs/vold.fstab:system/etc/vold.fstab

# Offmode charging
PRODUCT_PACKAGES += charger
PRODUCT_PACKAGES += charger_res_images

# Audio
PRODUCT_PACKAGES += \
    audio_policy.thunderc \
    audio.primary.thunderc \
    audio.a2dp.default \
    libaudioutils \

# Tiny alsa
PRODUCT_PACKAGES += libtinyalsa
PRODUCT_PACKAGES += tinyplay
PRODUCT_PACKAGES += tinycap
PRODUCT_PACKAGES += tinymix

# Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libtilerenderer \
    libopencorehw \
    gralloc.msm7x27 \
    copybit.msm7x27 \
    hwcomposer.msm7x27 \
    camera.thunderc  \
    dexpreopt \

# QCOM OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOmxCore \
    libdivxdrmdecrypt \
    libmm-omxcore \
    #libOmxVdec \
    #libOmxVenc \

# Misc
PRODUCT_PACKAGES += \
    lights.thunderc \
    sensors.thunderc \
    com.android.future.usb.accessory \
    gps.thunderc \
    hwaddrs \
    hcitool \
    hciconfig \
    lgapversion \
    Androidian \
    bdaddr_read \
    Apollo \

PRODUCT_PACKAGES += \
    libjni_latinime \
    librs_jni \
    brcm_patchram_plus \
    bash \
    nano \
    flash_image \
    erase_image \
    dump_image \
    thunderc_keypad.kcm.bin \

PRODUCT_PACKAGES += \
    Provision \
    GoogleSearch \
    LatinIME \
    QuickSearchBox \
    FileManager \


# XXX: These would normally be in vendor/aokp/products/PRODUCT_DEVICE.mk
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_320_480.zip:system/media/bootanimation.zip



# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml 


PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \
    ro.sf.lcd_density=160 \
    persist.sys.use_16bpp_alpha




PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=Quattrimus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)


