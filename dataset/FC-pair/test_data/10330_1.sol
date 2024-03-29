contract c10330{
    //a new 'block' to be mined
    function _startNewMiningEpoch() internal {
      //if max supply for the era will be exceeded next reward round then enter the new era before that happens
      //40 is the final reward era, almost all tokens minted
      //once the final era is reached, more tokens will not be given out because the assert function
      if( tokensMinted.add(getMiningReward()) > maxSupplyForEra && rewardEra < 39)
      {
        rewardEra = rewardEra + 1;
      }
      //set the next minted supply at which the era will change
      // total supply is 700000000000000000  because of 8 decimal places
      maxSupplyForEra = _totalSupply - _totalSupply.div( 2**(rewardEra + 1));
      epochCount = epochCount.add(1);
      //every so often, readjust difficulty. Dont readjust when deploying
      if(epochCount % _BLOCKS_PER_READJUSTMENT == 0)
      {
        _reAdjustDifficulty();
      }
      //make the latest ethereum block hash a part of the next challenge for PoW to prevent pre-mining future blocks
      //do this last since this is a protection mechanism in the mint() function
      challengeNumber = block.blockhash(block.number - 1);
    }
}