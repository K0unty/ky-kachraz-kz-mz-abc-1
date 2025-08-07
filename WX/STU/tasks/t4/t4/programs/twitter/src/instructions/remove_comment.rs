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

pub fn remove_comment(_ctx: Context<RemoveCommentContext>) -> Result<()> {
    Ok(())
}

#[derive(Accounts)]
pub struct RemoveCommentContext<'info> {
    #[account(mut)]
    pub comment_author: Signer<'info>,

    // The test harness passes this account with the name "tweet"
    // Keep it required in the context for stronger checks, but do not list it after comment.
    pub tweet: Account<'info, Tweet>,

    #[account(
        mut,
        has_one = comment_author,
        // Ensure the comment belongs to the provided tweet
        constraint = comment.parent_tweet == tweet.key(),
        // Close the comment and return rent to the author
        close = comment_author
    )]
    pub comment: Account<'info, Comment>,
}
