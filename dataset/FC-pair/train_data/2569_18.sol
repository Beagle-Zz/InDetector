contract c2569{
  // this contract has to be approved first by _erc223Contract
  function getERC20(address _from, uint256 _tokenId, address _erc223Contract, uint256 _value) public {
    bool allowed = _from == msg.sender;
    if(!allowed) {
      uint256 remaining;
      // 0xdd62ed3e == allowance(address,address)
      bytes memory calldata = abi.encodeWithSelector(0xdd62ed3e,_from,msg.sender);
      bool callSuccess;
      assembly {
        callSuccess := staticcall(gas, _erc223Contract, add(calldata, 0x20), mload(calldata), calldata, 0x20)
        if callSuccess {
          remaining := mload(calldata)
        }
      }
      require(callSuccess, "call to allowance failed");
      require(remaining >= _value, "Value greater than remaining");
      allowed = true;
    }
    require(allowed, "not allowed to getERC20");
    erc223Received(_from, _tokenId, _erc223Contract, _value);
    require(ERC20AndERC223(_erc223Contract).transferFrom(_from, this, _value), "ERC20 transfer failed.");
  }
}