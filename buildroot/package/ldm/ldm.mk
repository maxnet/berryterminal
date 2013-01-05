#############################################################
#
# LDM
#
#############################################################

LDM_VERSION = 2.2.9
LDM_SOURCE = ldm_$(LDM_VERSION).orig.tar.gz
LDM_SITE = http://archive.ubuntu.com/ubuntu/pool/main/l/ldm
LDM_INSTALL_STAGING = YES
LDM_INSTALL_TARGET = YES
LDM_CONF_OPT = --disable-nls 
LDM_DEPENDENCIES = libgtk2 openssh
LDM_AUTORECONF = YES

define LDM_POSTINSTALL
	$(INSTALL) -m 0755 package/ldm/S99ltsp $(TARGET_DIR)/etc/init.d/S99ltsp
	$(INSTALL) -m 0755 package/ldm/interfaces $(TARGET_DIR)/etc/network/interfaces
	$(INSTALL) -m 0755 package/ldm/default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
	chmod +x $(TARGET_DIR)/usr/share/ldm/ssh-hostchecker
	$(INSTALL) -m 0755 package/ldm/pango.modules $(TARGET_DIR)/etc/pango/pango.modules
	$(INSTALL) -m 0755 package/ldm/loaders.cache $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
	cp -a package/ldm/ltsp $(TARGET_DIR)/usr/share
	rm $(TARGET_DIR)/etc/init.d/S25pango || true
	rm $(TARGET_DIR)/etc/init.d/S26gdk-pixbuf || true
	rm $(TARGET_DIR)/etc/init.d/S50sshd || true
	rm $(TARGET_DIR)/usr/sbin/sshd || true
	rm $(TARGET_DIR)/usr/share/ldm/rc.d/I01-halt-check || true
endef

LDM_POST_INSTALL_TARGET_HOOKS += LDM_POSTINSTALL


$(eval $(autotools-package))
