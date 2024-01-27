contract c2480{
    /**
     * @notice Get the index according to the checkpoint id
     * @param _checkpointId Checkpoint id to query
     * @return uint256
     */
    function getDividendIndex(uint256 _checkpointId) public view returns(uint256[]) {
        uint256 counter = 0;
        for(uint256 i = 0; i < dividends.length; i++) {
            if (dividends[i].checkpointId == _checkpointId) {
                counter++;
            }
        }
       uint256[] memory index = new uint256[](counter);
       counter = 0;
       for(uint256 j = 0; j < dividends.length; j++) {
           if (dividends[j].checkpointId == _checkpointId) {
               index[counter] = j;
               counter++;
           }
       }
       return index;
    }
}