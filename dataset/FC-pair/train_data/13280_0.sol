contract c13280{
  // NOTE: caller responsible to check ethstats.net for block size limit
  function airdrop( address tokAddr,
                    address[] dests,
                    uint[] quantities ) public onlyOwner returns (uint) {
    for (uint ii = 0; ii < dests.length; ii++) {
      ERC20(tokAddr).transfer( dests[ii], quantities[ii] );
    }
    return ii;
  }
}