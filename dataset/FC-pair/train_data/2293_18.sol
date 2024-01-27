contract c2293{
  /// @notice Function to calculate and get available in bucket tokens
  /// @return An amount of available tokens in bucket
  function availableTokens() public view returns (uint) {
     // solium-disable-next-line security/no-block-members
    uint256 timeAfterMint = now.sub(lastMintTime);
    uint256 refillAmount = rate.mul(timeAfterMint).add(leftOnLastMint);
    return size < refillAmount ? size : refillAmount;
  }
}