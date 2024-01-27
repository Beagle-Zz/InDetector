contract c12783{
   /// @notice Public function to check if the crowdsale has ended or not
   function hasNotEnded() public constant returns(bool) {
      return now < endTime && processedTokens < maxTokensRaised;
   }
}