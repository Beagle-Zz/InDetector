contract c18600{
  /*
     Safety Methods
  */
  /*
     @notice This method can be used by the controller to extract mistakenly
     sent tokens to this contract.
     @param _token The address of the token contract that you want to recover
     set to 0 in case you want to extract ether.
  */
  function claimTokens(address _token) public onlyOwner {
    require(_token != address(token));
    if (_token == 0x0) {
      owner.transfer(this.balance);
      return;
    }
    HardcapToken _hardcapToken = HardcapToken(_token);
    uint256 balance = _hardcapToken.balanceOf(this);
    _hardcapToken.transfer(owner, balance);
    ClaimedTokens(_token, owner, balance);
  }
}