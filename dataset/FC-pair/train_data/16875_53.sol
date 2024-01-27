contract c16875{
    /**
     * Update the Medal Leaderboard for the Highest Miles
     */
    function updateHighestMiles_(uint256 _miles, address _owner) internal {
        uint256 newPos = maxLeaders;
        uint256 oldPos = maxLeaders;
        uint256 i;
        HighMileage memory tmp;
        // Determine positions
        for (i = maxLeaders-1; i >= 0; i--) {
            if (_miles >= _highestMiles[i].miles) {
                newPos = i;
            }
            if (_owner == _highestMiles[i].owner) {
                oldPos = i;
            }
            if (i == 0) { break; } // prevent i going below 0
        }
        // Insert or update leader
        if (newPos < maxLeaders) {
            if (oldPos < maxLeaders-1) {
                // update miles for existing leader
                _highestMiles[oldPos].miles = _miles;
                if (newPos != oldPos) {
                    // swap
                    tmp = _highestMiles[newPos];
                    _highestMiles[newPos] = _highestMiles[oldPos];
                    _highestMiles[oldPos] = tmp;
                }
            } else {
                // shift down
                for (i = maxLeaders-1; i > newPos; i--) {
                    _highestMiles[i] = _highestMiles[i-1];
                }
                // insert
                _highestMiles[newPos].miles = _miles;
                _highestMiles[newPos].owner = _owner;
            }
            // track lowest value
            _lowestHighMiles = _highestMiles[maxLeaders-1].miles;
        }
    }
}