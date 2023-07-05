#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Default
  NAME:=Default Profile
  PRIORITY:=1
  PACKAGES:=
endef

define Profile/Default/Description
	Default package set compatible with most boards.
endef
$(eval $(call Profile,Default))
