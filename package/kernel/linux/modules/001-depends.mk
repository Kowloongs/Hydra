#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define AddDepends/nls
  DEPENDS+= +kmod-nls-base $(foreach cp,$(1),+kmod-nls-$(cp))
endef

define AddDepends/rfkill
  DEPENDS+= +USE_RFKILL:kmod-rfkill $(1)
endef
