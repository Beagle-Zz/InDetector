contract c16533{
    //help debug mining software (even though challenge_digest isn't used, this function is constant and helps troubleshooting mining issues)
    function getMintDigest(uint256 nonce, bytes32 challenge_digest, bytes32 challenge_number) public view returns (bytes32 digesttest) {
        bytes32 digest = keccak256(challenge_number,msg.sender,nonce);
        return digest;
      }
}