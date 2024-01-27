contract c3116{
  //Just in case, owner wants to transfer Tokens from contract to owner address
    function manualWithdrawToken(uint256 _amount) onlyOwner public {
        uint tokenAmount = _amount * (1 ether);
        token.transfer(msg.sender, tokenAmount);
      }
}