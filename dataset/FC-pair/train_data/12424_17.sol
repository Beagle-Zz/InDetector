contract c12424{
    /** @dev Function for checking if the given address participated in given block.
      * @param _participant The participant whose participation we are going to check.
      * @param _blockNumber The block for which we will check the participation.
      * @return _isParticipate
      */
    function getIsParticipate(address _participant, uint256 _blockNumber) public view returns (bool _isParticipate) {
        return (participants[_participant].bets[_blockNumber].ODDBets > 0 || participants[_participant].bets[_blockNumber].EVENBets > 0);
    }
}