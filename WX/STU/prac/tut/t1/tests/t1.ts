import * as anchor from "@coral-xyz/anchor"
import { Program } from "@coral-xyz/anchor"
import { T1 } from "../target/types/t1"

describe("t1", () => {
  // Configure the client to use the local cluster.
  anchor.setProvider(anchor.AnchorProvider.env())

  const program = anchor.workspace.t1 as Program<T1>

  const signer = anchor.web3.Keypair.generate()

  it("Is initialized!", async () => {
    // Add your test here.
    const tx = await program.methods
      .initialize("Smeling Woman Ass")
      .accounts({
        signer: program.provider.wallet.publicKey,
      })
      .rpc()
    console.log("Your transaction signature", tx)
  })
})
