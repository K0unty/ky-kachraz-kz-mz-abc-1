import * as anchor from "@coral-xyz/anchor"
import { Program } from "@coral-xyz/anchor"
import { T1 } from "../target/types/t1"

describe("t1", () => {
  // Configure the client to use the local cluster.
  anchor.setProvider(anchor.AnchorProvider.env())

  const program = anchor.workspace.t1 as Program<T1>

  // Load existing wallet instead of generating new keypairs
  const signer = anchor.web3.Keypair.fromSecretKey(
    new Uint8Array(
      JSON.parse(
        require("fs").readFileSync("./solana_wallets/wallet_0.json", "utf-8")
      )
    )
  )

  it("Is initialized!", async () => {
    // Add your test here.
    const tx = await program.methods
      .initialize("Test Initialization")
      .accounts({
        signer: signer.publicKey,
        // Using program derived address for data account to avoid rent issues
        dataAccount: (
          await anchor.web3.PublicKey.findProgramAddress(
            [Buffer.from("data_account")],
            program.programId
          )
        )[0],
      })
      .signers([signer])
      .rpc()
    console.log("Your transaction signature", tx)
  })
})
