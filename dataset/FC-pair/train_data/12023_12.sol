contract c12023{
     // ------------------------------------------------------------------------
     // Remaining tokens for sale
     // ------------------------------------------------------------------------
     function remainingTokensForSale() public constant returns (uint) {
         return maxTokensToSale.sub(TOKENS_SOLD);
     }
}