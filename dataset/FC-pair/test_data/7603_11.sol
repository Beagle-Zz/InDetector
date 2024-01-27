contract c7603{
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
      require(canAcceptTokens_[_to] == true); // security check that contract approved by ProofofHumanity platform
      require(transfer(_to, _value)); // do a normal token transfer to the contract
      if (isContract(_to)) {
        AcceptsProofofHumanity receiver = AcceptsProofofHumanity(_to);
        require(receiver.tokenFallback(msg.sender, _value, _data));
      }
      return true;
    }
}