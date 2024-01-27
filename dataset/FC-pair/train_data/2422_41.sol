contract c2422{
  // owner can add slots in batches, 100 max
  function ownerAddSanSlotBatch(address[] _sanOwner, uint256[] _slotCount) external onlyOwner {
    require(_sanOwner.length == _slotCount.length);
    require(_sanOwner.length <= 100);
    for(uint8 i = 0; i < _sanOwner.length; i++) {
      require(_slotCount[i] > 0 && _slotCount[i] <= sanMaxAmount, "incorrect slot count");
      sanSlots[_sanOwner[i]] = sanSlots[_sanOwner[i]].add(_slotCount[i]);
      require(sanSlots[_sanOwner[i]] <= sanMaxAmount, "max san slots owned");
    }
  }
}