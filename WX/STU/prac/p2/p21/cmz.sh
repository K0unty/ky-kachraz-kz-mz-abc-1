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

# Address 
declare -a adrz=(
"6R8jqTmkxkPss4qxak6HKZSgnVqVyKCVVePM5bWn5azd"
"2RcCGxFX2dzj66k9khnC9NnLMvfZJQZV3hWpzkEiv1oz"
"7mMHVYwXFmGCe2SmpGs9J1tE9bJhEhWNz9f14u1gXd7f"
)

bal_t() {
    
    start_gfx
    hea1 "Solana Devnet balance checker"

    for address in "${adrz[@]}"
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

air_t() {
    start_gfx

    AMT="1"

    hea1 "AirPanty to adrez"

    for address in "${adrz[@]}"
    do
        echo -n "Airdropping to $address... "
        
        # Perform airdrop (suppress verbose output but keep errors)
        result=$(solana airdrop $AMT "$address" --url devnet 2>&1)
        
        if [[ $result == *"Signature"* ]]; then
            echo "✅ Success!"
        else
            echo "❌ Failed: $result"
        fi
        
        sleep 1  # Rate limiting protection
    done

    end_gfx
}

# Start Dockerz 
dok_st() {
    hea1 "Starting school-of-solana docker"
    co1="docker ps -a"
    co2="docker start school-of-solana"
    co3="docker exec -it school-of-solana bash"
    echo -e "${GREEN}Executing...${co1}${NC}"
    eval "$co1"
    echo -e "${GREEN}Executing...${co2}${NC}"
    eval "$co2"
    echo -e "${GREEN}Executing...${co3}${NC}"    
    eval "$co3"
}

# Anchor deploy 
anch_d() {
    start_gfx
    hea1 "Anchor deploy"
    co1="anchor deploy"
    echo -e "${GREEN}Executing...${co1}${NC}"
    eval "$co1"
    end_gfx
}


# --- Main Execution ---
# air_t
# bal_t
# anch_t
# dok_st
anch_d