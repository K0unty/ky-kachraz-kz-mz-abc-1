use anchor_lang::prelude::*;

declare_id!("D1y6eMGhY1kzSTYNNgF76LxqkDqkke64Wq141KLjXSnG");

#[program]
pub mod booty {
    use super::*;

    pub fn initialize(ctx: Context<Initialize>) -> Result<()> {
        msg!("Greetings from: {:?}", ctx.program_id);
        Ok(())
    }
}

#[derive(Accounts)]
pub struct Initialize {}
