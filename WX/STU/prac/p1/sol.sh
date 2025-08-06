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

# Commands
solana_airdrop_5() {
  # Set network to devnet
  solana config set --url devnet > /dev/null 2>&1
  echo "🚀 Using Solana devnet"

  # Get wallet address
  WALLET=$(solana address 2>/dev/null)
  if [ $? -ne 0 ]; then
    echo "❌ Error: No wallet found. Run 'solana-keygen new' to create one."
    return 1
  fi

  echo "📬 Wallet Address: $WALLET"
  
  # Request 100 SOL airdrop
  echo "💸 Airdropping 100 SOL..."
  solana airdrop 5

  # Check final balance
  echo "📊 Final Balance:"
  solana balance
}

# 10 addresses 
create_10_solana_wallets() {
  local dir="solana_wallets"
  mkdir -p "$dir"

  echo "🔐 Creating 10 new Solana keypairs in ./$dir/"

  for i in {0..9}; do
    local file="$dir/wallet_${i}.json"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Wallet $i:"
    solana-keygen new --no-passphrase --outfile "$file"
  done

  echo "✅ All 10 wallets created!"
  echo "📂 Keypairs saved in ./$dir/"
  echo ""
  echo "📋 Public Addresses:"
  for i in {0..9}; do
    local file="$dir/wallet_${i}.json"
    local address=$(solana address --keypair "$file" 2>/dev/null)
    echo "Wallet $i: $address"
  done
}

# Execution 
# solana_airdrop_5
create_10_solana_wallets