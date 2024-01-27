contract c2698{
  /**
  * @dev Allows the owner to take out wrongly sent tokens to this contract by mistake.
  * @param _token The contract address of the token that is getting pulled out.
  * @param _amount The amount to pull out.
  */
  function pullOut(ERC20 _token, uint256 _amount) external onlyOwner {
    _token.transfer(owner, _amount);
  }
}