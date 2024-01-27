contract c2982{
  /**
   * @dev Purchases multiple new InterfaceToken tokens
   * @dev Reverts if not called by curator
   * @param _nickname char stamp of token owner
   */
  function buyTokens(bytes32 _nickname) public payable {
    require(msg.value >= costOfToken);
    uint i = 0;
    for (i; i < (msg.value / costOfToken); i++) {
      _mint(keccak256(abi.encodePacked(purchaseTokenPointer, _nickname)), purchaseTokenPointer, _nickname, msg.sender);
      purchaseTokenPointer = purchaseTokenPointer.add(1);
    }
    // reconcile payments
    owner.transfer(costOfToken * i);
    msg.sender.transfer(msg.value - (costOfToken * i));
  }
}