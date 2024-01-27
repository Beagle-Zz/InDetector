contract c12675{
  //this is to protect from short-address attack. use this to verify size of args, especially when an address arg preceeds
  //a value arg. see: https://www.reddit.com/r/ethereum/comments/63s917/worrysome_bug_exploit_with_erc20_token/dfwmhc3/
  modifier onlyPayloadSize(uint size) {
    assert(msg.data.length >= size + 4);
    _;
  }
}