contract c2638{
  // Returns a random number using a specified block number
  // Always use a FUTURE block number.
  function maxRandom(uint blockn, address entropy) public view returns (uint256 randomNumber) {
    return uint256(keccak256(
        abi.encodePacked(
        blockhash(blockn),
        entropy)
      ));
  }
}