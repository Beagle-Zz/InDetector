contract c2293{
  /// @notice Function to mint tokens
  /// @param _to The address that will receive the minted tokens.
  /// @param _amount The amount of tokens to mint.
  /// @return A boolean that indicates if the operation was successful.
  function mint(address _to, uint256 _amount) public onlyMinter returns (bool) {
    uint256 available = availableTokens();
    require(_amount <= available);
    leftOnLastMint = available.sub(_amount);
    lastMintTime = now; // solium-disable-line security/no-block-members
    require(token.mint(_to, _amount));
    return true;
  }
}