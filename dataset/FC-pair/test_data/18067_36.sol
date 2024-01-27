contract c18067{
  /**
   * @notice Connect the auction contract to the RareCoin contract
   * @param rcContractAddress Address of RareCoin contract
   */
    function setRCContractAddress(address rcContractAddress) public {
        require(msg.sender == _beneficiary);
        require(_rcContract == address(0));
        _rcContract = rcContractAddress;
    }
}