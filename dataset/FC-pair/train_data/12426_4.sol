contract c12426{
    /** @dev Function which calculates the hash of the given block.
      * @param _blockNumber The block for which the hash will be calculated.
      * The function is called by the calculateRevenueAtBlock()
      * @return oddOrEven
      */
    function getBlockHashOddOrEven(uint256 _blockNumber) internal returns (uint8 oddOrEven) {
        blockHash[_blockNumber] = blockhash(_blockNumber);
        uint256 result = uint256(blockHash[_blockNumber]);
        uint256 lastChar = (result * 2 ** 252) / (2 ** 252);
        uint256 _oddOrEven = lastChar % 2;
        emit LogOddOrEven(_blockNumber, blockHash[_blockNumber], _oddOrEven);
        if (_oddOrEven == 1) {
            return ODD;
        } else if (_oddOrEven == 0) {
            return EVEN;
        }
    }
}