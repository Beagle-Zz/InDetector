contract c13762{
    /// @dev bonus to bettors who won.
    function _bonusToBettor(uint32 _season, uint8 _winner, uint bonusWinner) internal returns (bool) {
        uint winnerBet = _getWinnerBetted(_season, _winner);
        uint key = _season * 1000 + _winner;
        Betting[] storage items = allBittings[key];
        if (items.length == 0) {
            backToAll(_season);
            return true;
        } else {
            for (uint j = 0; j < items.length; j++) {
                Betting storage item = items[j];
                address account = item.account;
                uint newFund = safeDiv(safeMul(bonusWinner, item.amount), winnerBet); 
                _addMoney(account, newFund);
            }
            return false;
        }
    }
}