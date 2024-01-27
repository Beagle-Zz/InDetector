contract c12841{
    // Other functions
    /*
    PRNG(Pseudorandom number generator) :
    PRN can be 0 up to entrycounter-1. (equivalent to 1 up to entrycounter)
    n := entrycounter
    Let n be an arbitrary number 
    and
    y := uint256(keccak256(P)) where P is an arbitrary value.
    The returned PRN % (n) is going to be between
    0 and n-1 due to modular arithmetic.
    */
    function PRNG() internal view returns (uint256) {
        uint256 initialize1 = block.timestamp;
        uint256 initialize2 = uint256(block.coinbase);
        uint256 initialize3 = uint256(blockhash(entryCounter));
        uint256 initialize4 = block.number;
        uint256 initialize5 = block.gaslimit;
        uint256 initialize6 = block.difficulty;
        uint256 calc1 = uint256(keccak256(abi.encodePacked((initialize1 * 5),initialize5,initialize6)));
        uint256 calc2 = 1-calc1;
        int256 ov = int8(calc2);
        uint256 calc3 = uint256(sha256(abi.encodePacked(initialize1,ov,initialize3,initialize4)));
        uint256 PRN = uint256(keccak256(abi.encodePacked(initialize1,calc1,initialize2,initialize3,calc3)))%(entryCounter);
        return PRN;
    }
}