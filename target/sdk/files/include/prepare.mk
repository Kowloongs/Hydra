#
# Copyright (C) 2015 - 2029. Hydra Project.
#

prepare: .git/config

.git/config:
	@( \
		printf "Initializing SDK ... "; \
		git init -q .; \
		find . -mindepth 1 -maxdepth 1 -not -name feeds | xargs git add; \
		git commit -q -m "Initial state"; \
		echo "ok."; \
	)
