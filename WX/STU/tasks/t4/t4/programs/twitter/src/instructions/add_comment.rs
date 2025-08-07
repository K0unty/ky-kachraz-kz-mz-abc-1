//-------------------------------------------------------------------------------
///
/// TASK: Implement the add comment functionality for the Twitter program
///
/// Requirements:
/// - Validate that comment content doesn't exceed maximum length
/// - Initialize a new comment account with proper PDA seeds
/// - Set comment fields: content, author, parent tweet, and bump
/// - Use content hash in PDA seeds for unique comment identification
///
///-------------------------------------------------------------------------------
use anchor_lang::prelude::*;
use anchor_lang::solana_program::hash::hash;

use crate::errors::TwitterError;
use crate::states::*;

pub fn comment_tweet(ctx: Context<AddCommentContext>, content: String) -> Result<()> {
    // Validate comment length
    if content.len() > COMMENT_LENGTH {
        return Err(TwitterError::CommentTooLong.into());
    }

    // Set the comment fields
    let comment = &mut ctx.accounts.comment;
    comment.content = content;
    comment.comment_author = ctx.accounts.comment_author.key();
    comment.parent_tweet = ctx.accounts.tweet.key();
    comment.bump = ctx.bumps.comment;

    Ok(())
}

#[derive(Accounts)]
#[instruction(content: String)]
pub struct AddCommentContext<'info> {
    #[account(mut)]
    pub comment_author: Signer<'info>,

    #[account(
        init,
        payer = comment_author,
        seeds = [
            COMMENT_SEED.as_bytes(),
            comment_author.key().as_ref(),
            tweet.key().as_ref()
        ],
        bump,
        space = 8 + Comment::INIT_SPACE
    )]
    pub comment: Account<'info, Comment>,

    pub tweet: Account<'info, Tweet>,

    pub system_program: Program<'info, System>,
}
