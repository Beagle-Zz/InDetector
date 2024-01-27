contract c13972{
  // Avoid Short Address Attack
  modifier onlyPayloadSize(uint size) {
     assert(msg.data.length >= size + 4);
     _;
  }
}