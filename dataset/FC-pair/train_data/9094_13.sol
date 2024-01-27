contract c9094{
  // Forward ERC20 methods to upgraded contract if this one is deprecated
  function transfer(address _to, uint _value) public whenNotPaused {
    require(!isBlackListed[msg.sender]);
    if (deprecated) {
      return UpgradedStandardToken(upgradedAddress).transferByLegacy(msg.sender, _to, _value);
    } else {
      return super.transfer(_to, _value);
    }
  }
}