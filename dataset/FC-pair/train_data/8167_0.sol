contract c8167{
  // returning variable length arrays proved quite tricky...
  function reading_card_upright_at(uint8 index) view public returns(bool) {
    return readings[msg.sender].upright[index];
  }
}