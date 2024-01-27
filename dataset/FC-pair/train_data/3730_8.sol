contract c3730{
    // Calculating hash with a oracilize seed (Wolfram)
    function calculateHash() internal returns (uint) {
        return uint(keccak256(wolframRandom));
    }
}