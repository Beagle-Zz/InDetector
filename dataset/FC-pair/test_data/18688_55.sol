contract c18688{
    /**
     * @dev   Function compares array of entrant's 6 chosen numbers to
      *       the raffle in question's winning numbers, counting how
      *       many matches there are.
      *
      * @param _week         The week number of the Raffle in question
      * @param _entrant      Entrant's ethereum address
      * @param _entryNum     number of entrant's entry in question.
     */
    function getMatches(uint _week, address _entrant, uint _entryNum) constant internal returns (uint) {
        uint matches;
        for (uint i = 0; i < 6; i++) {
            for (uint j = 0; j < 6; j++) {
                if (raffle[_week].entries[_entrant][_entryNum - 1][i] == raffle[_week].winNums[j]) {
                    matches++;
                    break;
                }
            }
        }
        return matches;
    }
}