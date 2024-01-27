contract c7773{
  // BTC Owner checks if ETH Owner signed swap
  function checkSign(address _ownerAddress) public view returns (uint) {
    return participantSigns[_ownerAddress][msg.sender];
  }
}