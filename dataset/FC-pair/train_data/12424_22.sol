contract c12424{
    /** @dev Function which will return the ODD and EVEN bets.
      * @param _blockNumber The block for which we will get the commission.
      * @return _ODDBets, _EVENBets
      */
    function getBetsEvenAndODD(uint256 _blockNumber) public view returns (uint256 _ODDBets, uint256 _EVENBets) {
        return (oddAndEvenBets[_blockNumber][ODD], oddAndEvenBets[_blockNumber][EVEN]);
    }
}