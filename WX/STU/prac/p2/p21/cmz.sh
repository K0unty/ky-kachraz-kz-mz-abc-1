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
function deploy_to_devnet() {
    # Set variables
    WALLET_PATH="./solana_wallets/wallet_0.json"
    PROGRAM_NAME="p21"
    ANCHOR_TOML="./Anchor.toml"
    LIB_RS="./programs/${PROGRAM_NAME}/src/lib.rs"

    # 1. Check if wallet exists
    if [ ! -f "$WALLET_PATH" ]; then
        echo "❌ Error: Wallet not found at $WALLET_PATH"
        return 1
    fi

    # 2. Verify wallet
    echo "🔐 Verifying wallet..."
    if ! solana-keygen verify "$WALLET_PATH"; then
        echo "❌ Error: Wallet verification failed"
        return 1
    fi

    # 3. Check balance
    echo "💰 Checking balance..."
    BALANCE=$(solana balance --url devnet --keypair "$WALLET_PATH" | awk '{print $1}')
    if (( $(echo "$BALANCE < 1" | bc -l) )); then
        echo "⚠️ Low balance ($BALANCE SOL). Airdropping 2 SOL..."
        solana airdrop 2 --url devnet --keypair "$WALLET_PATH"
    fi

    # 4. Build program
    echo "🏗 Building program..."
    if ! anchor build; then
        echo "❌ Error: Build failed"
        return 1
    fi

    # 5. Get new program ID
    NEW_PROGRAM_ID=$(solana address -k "./target/deploy/${PROGRAM_NAME}-keypair.json")
    echo "🆔 New program ID: $NEW_PROGRAM_ID"

    # 6. Update program ID in files
    echo "✏️ Updating program ID..."
    sed -i.bak "s/^p21 = .*/p21 = \"$NEW_PROGRAM_ID\"/" "$ANCHOR_TOML"
    sed -i.bak "s/declare_id!(\".*\")/declare_id!(\"$NEW_PROGRAM_ID\")/" "$LIB_RS"

    # 7. Deploy to devnet
    echo "🚀 Deploying to devnet..."
    if ! anchor deploy --provider.cluster devnet --provider.wallet "$WALLET_PATH"; then
        echo "❌ Error: Deployment failed"
        return 1
    fi

    # 8. Run tests
    echo "🧪 Running tests..."
    if ! anchor test --provider.cluster devnet --provider.wallet "$WALLET_PATH"; then
        echo "❌ Error: Tests failed"
        return 1
    fi

    echo "🎉 Successfully deployed to devnet!"
    echo "Program ID: $NEW_PROGRAM_ID"
}



# --- Main Execution ---
# air_t
# bal_t
deploy_to_devnet
# dok_st
# anch_d
# wal_ver