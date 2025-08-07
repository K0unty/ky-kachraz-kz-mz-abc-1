//-------------------------------------------------------------------------------
///
/// TASK: Implement the remove comment functionality for the Twitter program
/// 
/// Requirements:
/// - Close the comment account and return rent to comment author
/// 
/// NOTE: No implementation logic is needed in the function body - this 
/// functionality is achieved entirely through account constraints!
/// 
///-------------------------------------------------------------------------------

use anchor_lang::prelude::*;
use anchor_lang::solana_program::hash::hash;

use crate::states::*;

pub fn remove_comment(_ctx: Context<RemoveCommentContext>, _content: String) -> Result<()> {
    Ok(())
}

#[derive(Accounts)]
#[instruction(content: String)]
pub struct RemoveCommentContext<'info> {
    #[account(
        mut,
        seeds = [
            COMMENT_SEED.as_bytes(),
            comment_author.key().as_ref(),
            &hash(content.as_bytes()).to_bytes(),
            tweet.key().as_ref()
        ],
        bump = comment.bump,
        has_one = comment_author,
        close = comment_author
    )]
    pub comment: Account<'info, Comment>,
    
    #[account(mut)]
    pub tweet: Account<'info, Tweet>,
    
    pub comment_author: Signer<'info>,
}
