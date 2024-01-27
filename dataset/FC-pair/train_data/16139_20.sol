contract c16139{
  // In case you mess something up during minting
  // NOTE: You must prefix hashes with '0x'
  function replaceChiphash (uint chipId, bytes32 newHash) public onlyOwner whenPaused {
    require(chips[chipId].hash != ""); // chip hash must not be unset
    bytes32 oldHash = chips[chipId].hash;
    chips[chipId].hash = newHash;
    emit ChipHashReplaced(chipId, newHash, oldHash);
  }
}