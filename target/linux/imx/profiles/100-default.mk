#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Default
  PRIORITY:=1
  NAME:=Default Profile
endef

define Profile/Default/Description
 Package set compatible with most NXP i.MX based boards.
endef

$(eval $(call Profile,Default))
