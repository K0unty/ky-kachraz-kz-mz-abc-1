use anchor_lang::prelude::*;

declare_id!("B1mwXwsaY8nPUTJ3coexanu7Dp8nFsmZuFtGL3iWuntD");

#[program]
pub mod t1 {
    use super::*;

    pub fn initialize(ctx: Context<Initialize>) -> Result<()> {
        msg!("SmellHerFarts: {:?}", ctx.program_id);
        Ok(())
    }
}

#[derive(Accounts)]
pub struct Initialize<'info> {
    pub signer: Signer<'info>,
    #[account(
        init,
        payer = signer,
        space = 8 + 32,
        seeds = [b"PissDrink"],
        bump,
    )]
    pub data_account: Account<'info, PissDrink>,
}

#[account]
pub struct PissDrink {
    pub LickPussy: String,
}
