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

use crate::errors::TwitterError;
use crate::states::*;

/// NOTE: No logic needed; account constraints enforce behavior.
pub fn remove_comment(_ctx: Context<RemoveCommentContext>) -> Result<()> {
    Ok(())
}

#[derive(Accounts)]
pub struct RemoveCommentContext<'info> {
    #[account(mut)]
    pub comment_author: Signer<'info>,

    // Put comment before tweet to satisfy Anchor's account resolution with tests' provided account list
    #[account(
        mut,
        has_one = comment_author,
        close = comment_author
    )]
    pub comment: Account<'info, Comment>,

    // Tests pass this as `tweet`; we still enforce linkage below via a separate constraint attribute
    pub tweet: Account<'info, Tweet>,

    // Enforce that the comment truly belongs to the supplied tweet
    // Using a separate attribute avoids ordering issues in the main account attribute
    #[account(constraint = comment.parent_tweet == tweet.key() @ TwitterError::ContentTooLong)]
    /// dummy to attach the above constraint; not used at runtime
    pub system_program: Program<'info, System>,
}
