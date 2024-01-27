contract c16965{
    /**
    * @notice Return current round according to current time
    */ 
    function RoundIndex() internal returns(uint256) {
      uint256 index = 0;
      for (uint256 r=0; r<rounds.length; r++){
        if ( (rounds[r].start < uint256(block.timestamp)) && (uint256(block.timestamp) < rounds[r].end) ) {
          index = r.add(1);
        }
      }
      return index;
    }
}