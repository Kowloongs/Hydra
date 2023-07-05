#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Generic
  NAME:=Octeon SoC
endef

define Profile/Generic/Description
   Base packages for Octeon boards.
endef

$(eval $(call Profile,Generic))
