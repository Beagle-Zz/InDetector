contract c10408{
  /**
   * @dev Set the ifoodCommunity
   * @param _ifoodCommunity The new ifood community address
   */
  function setifoodCommunityAddress(address _ifoodCommunity) only(ifoodCommunity) nonZeroAddress(_ifoodCommunity) public {
    ifoodCommunity = _ifoodCommunity;
    SetifoodCommunityAddress(msg.sender, _ifoodCommunity);
  }
}