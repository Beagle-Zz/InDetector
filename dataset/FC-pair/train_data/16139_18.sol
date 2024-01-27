contract c16139{
  // NOTE: You must prefix hashes with '0x'
  function mintChip (bytes32 hash) public onlyOwner {
    chips[numChipsMinted] = Chip(hash, false);
    emit ChipMinted(numChipsMinted);
    numChipsMinted = numChipsMinted.add(1);
  }
}