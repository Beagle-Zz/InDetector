contract c7427{
  /**
  * @dev Airdrops SUPM tokens to the specified adresses
  * @param _recipients The list of addresses to send to
  * @param _balances Values corresponding to the addresses
  */
  function airdrop(address[] _recipients, uint256[] _balances) public onlyOwner{
    require(_recipients.length == _balances.length);
    for (uint i=0; i < _recipients.length; i++) {
        transfer(_recipients[i], _balances[i]);
    }
  }
}