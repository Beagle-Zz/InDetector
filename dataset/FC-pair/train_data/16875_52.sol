contract c16875{
    /**
     * Update the Medal Leaderboard for the Highest Price
     */
    function updateHighestPrices_(uint256 _price, address _owner) internal {
        uint256 newPos = maxLeaders;
        uint256 oldPos = maxLeaders;
        uint256 i;
        HighPrice memory tmp;
        // Determine positions
        for (i = maxLeaders-1; i >= 0; i--) {
            if (_price >= _highestPrices[i].price) {
                newPos = i;
            }
            if (_owner == _highestPrices[i].owner) {
                oldPos = i;
            }
            if (i == 0) { break; } // prevent i going below 0
        }
        // Insert or update leader
        if (newPos < maxLeaders) {
            if (oldPos < maxLeaders-1) {
                // update price for existing leader
                _highestPrices[oldPos].price = _price;
                if (newPos != oldPos) {
                    // swap
                    tmp = _highestPrices[newPos];
                    _highestPrices[newPos] = _highestPrices[oldPos];
                    _highestPrices[oldPos] = tmp;
                }
            } else {
                // shift down
                for (i = maxLeaders-1; i > newPos; i--) {
                    _highestPrices[i] = _highestPrices[i-1];
                }
                // insert
                _highestPrices[newPos].price = _price;
                _highestPrices[newPos].owner = _owner;
            }
            // track lowest value
            _lowestHighPrice = _highestPrices[maxLeaders-1].price;
        }
    }
}