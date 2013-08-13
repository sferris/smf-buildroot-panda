################################################################################
#
# fmtools
#
################################################################################

FMTOOLS_VERSION = 2.0.1
FMTOOLS_SOURCE = fmtools-$(FMTOOLS_VERSION).tar.gz
FMTOOLS_SITE = http://benpfaff.org/fmtools/
FMTOOLS_INSTALL_STAGING = YES

#FMTOOLS_CONF_OPT = \

$(eval $(call AUTOTARGETS))
