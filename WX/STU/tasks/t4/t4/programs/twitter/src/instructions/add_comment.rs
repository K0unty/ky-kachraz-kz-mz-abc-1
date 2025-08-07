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

use crate::errors::TwitterError;
use crate::states::*;

pub fn add_comment(ctx: Context<AddCommentContext>, comment_content: String) -> Result<()> {
    // Validate comment length
    if comment_content.len() > COMMENT_LENGTH {
        return Err(TwitterError::CommentTooLong.into());
    }

    // Set the comment fields
    let comment = &mut ctx.accounts.comment;
    comment.content = comment_content;
    comment.comment_author = ctx.accounts.comment_author.key();
    comment.parent_tweet = ctx.accounts.tweet.key();
    comment.bump = *ctx.bumps.get("comment").unwrap();

    Ok(())
}

#[derive(Accounts)]
#[instruction(comment_content: String)]
#[derive(Accounts)]
pub struct AddCommentContext<'info> {
    #[account(
        init,
        seeds = [
            COMMENT_SEED.as_bytes(),
            comment_author.key().as_ref(),
            hash(comment_content.as_bytes()).to_bytes().as_ref(),
            tweet.key().as_ref(),
        ],
        bump,
        payer = comment_author,
        space = 8 + Comment::INIT_SPACE,
    )]
    pub comment: Account<'info, Comment>,

    pub comment_author: Signer<'info>,

    #[account(mut)]
    pub tweet: Account<'info, Tweet>,

    pub system_program: Program<'info, System>,
}
