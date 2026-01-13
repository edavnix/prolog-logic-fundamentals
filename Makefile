# Makefile for prolog-logic-fundamentals
# Documentation: https://www.gnu.org/software/make/manual/make.html
# Usage: make run file=src/<file.pl>

# Interpreter and Flags
PROLOG       = swipl
PROLOG_FLAGS = -q -t halt

# Colors for the terminal
RED          = \033[0;31m
GREEN        = \033[0;32m
YELLOW       = \033[0;33m
CYAN         = \033[0;36m
NC           = \033[0m

# Status Prefixes
ERROR        = $(RED)[ ERROR ]$(NC)
INFO         = $(YELLOW)[ INFO  ]$(NC)
SUCCESS      = $(GREEN)[SUCCESS]$(NC)
EXEC         = $(CYAN)[ EXEC  ]$(NC)

.PHONY: run help

run:
	@if [ -z "$(file)" ]; then \
		printf "$(ERROR) $(RED) Error: No file specified. $(NC)\n"; \
		printf "$(INFO) $(YELLOW) Recommendation: Use the 'file=' variable to specify the path. $(NC)\n"; \
		printf "$(INFO) $(CYAN) Usage: make run file=src/<file.pl> $(NC)\n"; \
		exit 1; \
	fi

	@if [ ! -f "$(file)" ]; then \
		printf "$(ERROR) $(RED) Error: File '$(file)' not found. $(NC)\n"; \
		exit 1; \
	fi

	@case "$(file)" in \
		*.pl) ;; \
		*) printf "$(ERROR) $(RED) Error: '$(file)' is not a .pl file. $(NC)\n"; exit 1 ;; \
	esac

	@printf "$(EXEC) $(CYAN) Executing: $(file) $(NC)\n"
	@$(PROLOG) $(PROLOG_FLAGS) -s $(file)
	@printf "$(SUCCESS) $(GREEN) Success: Execution finished. $(NC)\n"

help:
	@printf "$(INFO) $(CYAN) Usage: make run file=src/<file.pl> $(NC)\n"
	@printf "$(INFO) $(YELLOW) Recommendation: You can use TAB to autocomplete the path after 'file=' $(NC)\n"
	@printf "$(INFO) $(CYAN) Example: make run file=src/01_animal_hierarchy.pl $(NC)\n"
