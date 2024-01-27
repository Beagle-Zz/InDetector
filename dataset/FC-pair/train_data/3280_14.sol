contract c3280{
    // get the current bonus percentage, as a whole number
    function getBonusPercentage() public constant returns (uint256) {
        uint256 finalBonus;
        uint256 iterativeTimestamp;
        uint256 iterativeBonus;
        // within bonuses, even numbered elements store timestamps and odd numbered elements store bonus percentages
        // timestamps are in order from oldest to newest
        // iterates over the elements and if the timestamp has been surpassed, the bonus percentage is denoted
        // the last bonus percentage that was denoted, if one was denoted at all, is the correct bonus percentage at this time
        for (uint256 i = 0; i < bonuses.length; i++) {
            if (i % 2 == 0) {
                iterativeTimestamp = bonuses[i];
            } else {
                iterativeBonus = bonuses[i];
                if (block.timestamp >= iterativeTimestamp) {
                    finalBonus = iterativeBonus;
                }
            }
        } 
        return finalBonus;
    }    
}