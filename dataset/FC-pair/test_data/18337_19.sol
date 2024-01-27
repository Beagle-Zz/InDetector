contract c18337{
  // returns number of quarters buyer got
  function _buy(address buyer) internal returns (uint256) {
    require(buyer != address(0));
    uint256 nq = (msg.value * ethRate) / (10 ** 18);
    require(nq != 0);
    if (nq > tranche) {
      nq = tranche;
    }
    totalSupply += nq;
    balances[buyer] += nq;
    trueBuy[buyer] += nq;
    outstandingQuarters += nq;
    // change tranche size
    _changeTrancheIfNeeded();
    // event for quarters order (invoice)
    emit QuartersOrdered(buyer, msg.value, nq);
    // log rate change
    emit BaseRateChanged(getBaseRate(), tranche, outstandingQuarters, address(this).balance, totalSupply);
    // transfer owner's cut
    Q2(q2).disburse.value(msg.value * 15 / 100)();
    // return nq
    return nq;
  }
}