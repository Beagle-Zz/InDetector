contract c12424{
    /** @dev Function for getting the bets for ODD and EVEN.
      * @param _participant The address of the participant whose bets you want to check.
      * @param _blockNumber The block for which you want to check.
      * @return _oddBets, _evenBets
      */
    function getBetAt(address _participant, uint256 _blockNumber) public view returns (uint256 _oddBets, uint256 _evenBets){
        return (participants[_participant].bets[_blockNumber].ODDBets, participants[_participant].bets[_blockNumber].EVENBets);
    }
}