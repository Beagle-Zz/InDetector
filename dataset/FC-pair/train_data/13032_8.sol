contract c13032{
	/**
    * Transfer token to a specified address and forward the data to recipient
    * ERC-677 standard
    * https://github.com/ethereum/EIPs/issues/677
    * @param _to    Receiver address.
    * @param _value Amount of tokens that will be transferred.
    * @param _data  Transaction metadata.
    */
    function transferAndCall(address _to, uint256 _value, bytes _data) external returns (bool) {
      require(_to != address(0));
      require(transfer(_to, _value)); // do a normal token transfer to the contract
      if (isContract(_to)) {
        AcceptsProof receiver = AcceptsProof(_to);
        require(receiver.tokenFallback(msg.sender, _value, _data));
      }
      return true;
    }
}