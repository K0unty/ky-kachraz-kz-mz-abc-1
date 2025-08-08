use anchor_lang::prelude::*;

declare_id!("8Re4KgcYHxU2zYb1jJ32a334aytW1bjUAgLyCHUGhqUt");

#[program]
pub mod p21 {
    use super::*;

    pub fn initialize(ctx: Context<Initialize>) -> Result<()> {
        msg!("Greetings from: {:?}", ctx.program_id);
        Ok(())
    }
}

#[derive(Accounts)]
pub struct Initialize {}
