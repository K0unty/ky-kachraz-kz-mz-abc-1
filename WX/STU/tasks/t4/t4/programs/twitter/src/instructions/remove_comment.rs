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

use crate::states::*;

/// NOTE: No logic needed; account constraints enforce behavior.
pub fn remove_comment(_ctx: Context<RemoveCommentContext>) -> Result<()> {
    Ok(())
}

#[derive(Accounts)]
pub struct RemoveCommentContext<'info> {
    #[account(mut)]
    pub comment_author: Signer<'info>,

    // Must be provided by the client/tests
    pub tweet: Account<'info, Tweet>,

    // Close the comment to its author; ensure only the author can remove it
    // Also ensure the comment actually belongs to the provided tweet
    #[account(
        mut,
        has_one = comment_author,
        constraint = comment.parent_tweet == tweet.key(),
        close = comment_author
    )]
    pub comment: Account<'info, Comment>,
}
