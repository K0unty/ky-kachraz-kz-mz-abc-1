#!/usr/bin/bash
# Running Commands 
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

start_gfx() {
    echo -e "${GREEN}"
    echo -e "███████╗ ████████╗  █████╗   █████╗  ██████╗  ████████╗"
    echo -e "██╔════╝ ╚══██╔══╝ ██╔══██╗ ██╔══██╗ ██╔══██╗ ╚══██╔══╝"
    echo -e "███████╗    ██║    ███████║ ███████║ ██████╔╝    ██║   "
    echo -e "╚════██║    ██║    ██╔══██║ ██╔══██║ ██╔══██╗    ██║   "
    echo -e "███████║    ██║    ██║  ██║ ██║  ██║ ██║  ██║    ██║   "
    echo -e "╚══════╝    ╚═╝    ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝    ╚═╝  "
    echo -e "${NC}"
}

end_gfx() {
    echo -e "${RED}"
    echo -e "███████╗ ███╗   ██╗ ██████╗ "
    echo -e "██╔════╝ ████╗  ██║ ██╔══██╗"
    echo -e "█████╗   ██╔██╗ ██║ ██║  ██║"
    echo -e "██╔══╝   ██║╚██╗██║ ██║  ██║"
    echo -e "███████╗ ██║ ╚████║ ██████╔╝"
    echo -e "╚══════╝ ╚═╝  ╚═══╝ ╚═════╝ "
    echo -e "${NC}"
}


# Make a new project
anch_t() {
    start_gfx
    hea1 "Execute Anchor Test"
    co1="anchor test"
    echo -e "${GREEN}Executing...${co1}${NC}"
    eval "$co1"
    end_gfx
}

bal_t() {
    
    start_gfx
    hea1 "Solana Devnet balance checker"
    
    # Address 
    declare -a addresses=(
    "6R8jqTmkxkPss4qxak6HKZSgnVqVyKCVVePM5bWn5azd"
    "2RcCGxFX2dzj66k9khnC9NnLMvfZJQZV3hWpzkEiv1oz"
    "7mMHVYwXFmGCe2SmpGs9J1tE9bJhEhWNz9f14u1gXd7f"
    )

    for address in "${addresses[@]}"
    do
    echo -en "Checking devent balance for ${BLUE} $address: ${NC}"
    balance=$(solana balance "$address" --url devnet 2>/dev/null)
    
    if [ $? -eq 0 ]; then
        echo -e "${YELLOW}$balance${NC}"
    else
        echo "Error fetching balance (invalid address or connection issue)"
    fi
    done

    end_gfx
}


# --- Main Execution ---
# anch_t
bal_t