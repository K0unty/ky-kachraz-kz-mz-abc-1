//-------------------------------------------------------------------------------
///
/// TASK: Implement the remove reaction functionality for the Twitter program
/// 
/// Requirements:
/// - Verify that the tweet reaction exists and belongs to the reaction author
/// - Decrement the appropriate counter (likes or dislikes) on the tweet
/// - Close the tweet reaction account and return rent to reaction author
/// 
///-------------------------------------------------------------------------------

use anchor_lang::prelude::*;

use crate::errors::TwitterError;
use crate::states::*;

pub fn remove_reaction(ctx: Context<RemoveReactionContext>) -> Result<()> {
    // TODO: Implement remove reaction functionality
    todo!()
}

#[derive(Accounts)]
pub struct RemoveReactionContext<'info> {
    pub reaction_author: Signer<'info>,

    #[account(
        mut,
        has_one = reaction_author,
        close = reaction_author
    )]
    pub tweet_reaction: Account<'info, Reaction>,

    #[account(
        mut,
        constraint = tweet.key() == tweet_reaction.parent_tweet
    )]
    pub tweet: Account<'info, Tweet>,
}
