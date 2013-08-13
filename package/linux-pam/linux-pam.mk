############################################
#
# linux-pam
#
############################################


LINUX_PAM_VERSION = 1.1.4
LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
LINUX_PAM_SITE = http://linux-pam.org/library/
LINUX_PAM_INSTALL_STAGING = YES
LINUX_PAM_INSTALL_TARGET = YES
LINUX_PAM_CONF_OPT = --disable-prelude --disable-isadir --disable-nis --disable-regenerate-docu
LINUX_PAM_CONF_OPT += --enable-securedir=/lib/security --libdir=/lib
LINUX_PAM_DEPENDENCIES = gettext libintl flex

define LINUX_PAM_BUILD_CMDS
        $(MAKE) CC="$(TARGET_CC) -lintl -lfl" LD="$(TARGET_LD)" -C $(@D) all
endef

define LINUX_PAM_DISABLE_INNETGR
#        echo >>$(@D)/config.h
#        echo "#undef HAVE_RUSEROK">>$(@D)/config.h
#        echo "#define HAVE_RUSEROK_AF">>$(@D)/config.h
#        echo "#define ruserok_af(a, b, c, d, e) (-1)" >>$(@D)/config.h
#        echo "#undef innetgr">>$(@D)/config.h
#        echo "#define innetgr(a, b, c, d) 0" >>$(@D)/config.h
        echo "all:" >$(@D)/doc/Makefile
        echo "" >>$(@D)/doc/Makefile
        echo "install:" >>$(@D)/doc/Makefile
        echo "" >>$(@D)/doc/Makefile
endef

LINUX_PAM_POST_CONFIGURE_HOOKS += LINUX_PAM_DISABLE_INNETGR

$(eval $(call AUTOTARGETS,package,linux-pam))
