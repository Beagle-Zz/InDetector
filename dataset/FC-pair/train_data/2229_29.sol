contract c2229{
  /*
    modifiers to avoid short address attack
  */
  modifier onlyPayloadSize(uint size) {
    assert(msg.data.length == size + 4);
    _;
  } 
}