contract c13762{
    /// @dev caculate total amount betted on winner
    function _getWinnerBetted(uint32 _season, uint32 _winner) internal view returns (uint){
        uint sum = 0;
        uint key = _season * 1000 + _winner;
        Betting[] storage items = allBittings[key];
        for (uint j = 0; j < items.length; j++) {
            Betting storage item = items[j];
            sum += item.amount;
        }
        return sum;
    }
}