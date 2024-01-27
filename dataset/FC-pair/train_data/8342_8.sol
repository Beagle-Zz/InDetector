contract c8342{
  // This is independent of Stock and Altar.
  function buyStore() external payable {
    address _from = store.owner;
    uint256 _price = store.cost.mul(INCREMENT_RATE) / 10;
    _payEthereum(_price);
    uint256 _halfMargin = (_price - store.cost) / 2;
    devFee = devFee.add(_halfMargin);
    ethereumBalance[_from] = ethereumBalance[_from].add(_price - _halfMargin).add(store.balance);
    store.cost = _price;
    store.owner = msg.sender;
    delete store.balance;
    emit BuyStore(_from, msg.sender, _price);
  }
}