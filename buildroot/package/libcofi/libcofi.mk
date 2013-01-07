#############################################################
#
# libcofi
#
#############################################################
LIBCOFI_VERSION = 7313fbe12b0593034d0a1b606bf33c7cf4ababce
LIBCOFI_SITE = http://github.com/simonjhall/copies-and-fills/tarball/master

define LIBCOFI_BUILD_CMDS
    $(MAKE1) AS="$(TARGET_AS)" CC="$(TARGET_CC)" -C $(@D) libcofi_rpi.so
endef

define LIBCOFI_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/libcofi_rpi.so* $(TARGET_DIR)/usr/lib
endef

$(eval $(generic-package))
