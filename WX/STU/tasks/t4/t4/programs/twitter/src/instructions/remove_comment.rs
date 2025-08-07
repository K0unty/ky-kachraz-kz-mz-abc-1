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

    // Tests pass the parent tweet account as `tweet`
    pub tweet: Account<'info, Tweet>,

    #[account(
        mut,
        has_one = comment_author,
        // Ensure this comment is for the provided tweet
        constraint = comment.parent_tweet == tweet.key(),
        // Return rent to the comment_author on close
        close = comment_author
    )]
    pub comment: Account<'info, Comment>,
}
