contract c18738{
 /**
  * generate a random number.
  * @param nonce a nonce to make sure there's not always the same number returned in a single block.
  * @return the random number
  * */
 function generateRandomNumber(uint256 nonce) internal view returns(uint) {
   return uint(keccak256(block.blockhash(block.number - 1), now, numCharacters, nonce));
 }
}