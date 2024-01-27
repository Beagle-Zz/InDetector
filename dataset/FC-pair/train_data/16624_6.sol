contract c16624{
  // Hashes an Option's parameters for use in looking up information about the Option.  Callable internally and externally.
  // Variables are grouped into arrays as a workaround for the "too many local variables" problem.
  // Instead of directly encoding the asset exchange rate (Strike Price), it is instead implicitly
  // stored as the ratio of amountLocked, the amount of assetLocked stored in the Option, and amountTraded,
  // the amount of assetTraded needed to exercise the Option.
  function getOptionHash(address[3] assetLocked_assetTraded_firstMaker,
                         uint256[3] amountLocked_amountTraded_maturation) pure public returns(bytes32) {
    bytes32 optionHash = keccak256(assetLocked_assetTraded_firstMaker[0],
                                   assetLocked_assetTraded_firstMaker[1],
                                   assetLocked_assetTraded_firstMaker[2],
                                   amountLocked_amountTraded_maturation[0],
                                   amountLocked_amountTraded_maturation[1],
                                   amountLocked_amountTraded_maturation[2]);
    return optionHash;
  }
}