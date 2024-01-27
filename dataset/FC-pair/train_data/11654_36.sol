contract c11654{
  // rarity 0: common (1 element)
  // rarity 1: rare (2 elements)
  // rarity 2: epic (3 elements)
  // rarity 3: legendary (4 elements)
  // rarity 4: ultimate (all 5 elements)
  function constructWeaponTokenId(uint rand, uint rarity, uint pureDamage) pure internal returns (uint) {
    uint lootTokenId = (rand & 0xffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000) + rarity;
    bytes10[4] memory elementsAvailablePerRarity = [
      elementsAvailableForCommon,
      elementsAvailableForRare,
      elementsAvailableForEpic,
      elementsAvailableForLegendary
      ];
    bytes10 elementsAvailable = elementsAvailablePerRarity[rarity];
    // Select a random byte in elementsAvailable
    uint8 elementsUsed = uint8(elementsAvailable[((rand >> 104) & 0xffff) % 10]);
    // The bits of elementsUsed represent which elements we will allow this weapon to deal damage for
    // Zero out the other element damages
    for (uint i = 0; i < 5; i++) {
      if ((elementsUsed & (1 << i)) == 0) {
        lootTokenId = lootTokenId & ~(0xff << (64 + i*8));
      }
    }
    pureDamage = Math.min256(100, pureDamage);
    lootTokenId = lootTokenId | (pureDamage << 56);
    return lootTokenId;
  }
}