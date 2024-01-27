contract c7719{
  //Fix for the ERC20 short address attack.
  modifier onlyPayloadSize(uint size) {
    assert(msg.data.length >= size + 4);
    _;
  } 
}