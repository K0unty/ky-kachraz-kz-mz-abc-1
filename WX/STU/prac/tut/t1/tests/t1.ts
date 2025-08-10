import * as anchor from "@coral-xyz/anchor"
import { Program } from "@coral-xyz/anchor"
import { T1 } from "../target/types/t1"

describe("t1", () => {
  // Configure the client to use the local cluster.
  anchor.setProvider(anchor.AnchorProvider.env())

  const program = anchor.workspace.t1 as Program<T1>

  const signer = anchor.web3.Keypair.generate()
  const dataAccount = anchor.web3.Keypair.generate()

  it("Is initialized!", async () => {
    program.provider.connection.confirmTransaction(
      await program.provider.connection.requestAirdrop(
        signer.publicKey,
        1000000000
      ),
      "raped"
    )

    // Add your test here.
    const tx = await program.methods
      .initialize("Smeling Woman Ass")
      .accounts({
        signer: signer.publicKey,
        dataAccount: dataAccount.publicKey,
      })
      .signers([signer, dataAccount])
      .rpc()
    console.log("Your transaction signature", tx)
  })
})
