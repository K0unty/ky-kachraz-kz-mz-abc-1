#!/usr/bin/bash
# Cargo and rust auto
clear

# Colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export WHITE='\033[0;37m'
export NC='\033[0m' # No Color

# Header function
hea1() {
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
}

# Make a new project
cargo_new() {
    hea1 "Cargo New Initialization with yansi and cfonts"
    echo -e "${WHITE}Enter the name of the project:${NC} "
    read -r name_of_project
    if [ -z "$name_of_project" ]; then
        echo -e "${RED}Project name cannot be empty!${NC}"
        exit 1
    fi

    echo -e "\n${GREEN}---Commands to execute:---${NC}"
    echo -e "  > cargo new $name_of_project"
    echo -e "  > cd $name_of_project"
    echo -e "  > cargo add yansi cfonts"
    echo -e "  > cargo tree"
    echo -e "${YELLOW}Executing...${NC}\n"

    eval "cargo new \"$name_of_project\""
    cd "$name_of_project" || exit 1
    cargo add yansi cfonts
    cargo tree
    
    echo -e "\n${GREEN}Project created successfully!${NC}"
}

# Remove all targets
cargo_remove_target() {
    hea1 "Cargo Clean Recursive"
    local co1='find . -name "Cargo.toml" -execdir cargo clean \;'
    echo -e "${GREEN}Executing:${NC} $co1"
    eval "$co1"
    echo -e "\n${GREEN}Clean completed!${NC}"
}

# Display menu
show_menu() {
    clear
    hea1 "Rust Project Manager"
    echo -e "${BLUE}1)${NC} Create New Cargo Project"
    echo -e "${BLUE}2)${NC} Clean All Target Directories"
    echo -e "${BLUE}3)${NC} Exit"
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
    echo -ne "${WHITE}Choose an option [1-3]: ${NC}"
}

# Main execution
show_menu
read -r choice
case $choice in
    1)
        cargo_new
        ;;
    2)
        cargo_remove_target
        ;;
    3)
        echo -e "${GREEN}Goodbye!${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}Invalid option. Exiting.${NC}"
        exit 1
        ;;
esac

echo -e "\n${YELLOW}Press any key to exit...${NC}"
read -n 1 -s