contract c12991{
    // Other functions
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