contract c4916{
    /**
      @dev Sends all avaible TAY to the TGE contract to be properly
      distribute
      @param _tgeAddress address Address of the token distribution
      contract
    **/
    function distribute(address _tgeAddress)
      public
      onlyOwner
    {
      whitelistedTransfer[_tgeAddress] = true;
      transfer(_tgeAddress, balances[owner]);
    }
}