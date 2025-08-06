use anchor_lang::prelude::*;

declare_id!("4DHmXPyVMB6ULWFrTDM1pNqajhUo2jFep844Rn1JzB8r");

#[program]
pub mod pe1 {
    use super::*;

    pub fn initialize(ctx: Context<Initialize>) -> Result<()> {
        msg!("Greetings from: {:?}", ctx.program_id);
        Ok(())
    }
}

#[derive(Accounts)]
pub struct Initialize {}
