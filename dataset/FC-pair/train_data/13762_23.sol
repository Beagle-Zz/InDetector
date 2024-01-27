contract c13762{
    /// @dev bonus to the fighters in the season.
    function _bonusToFighters(uint32 _season, uint8 _winner, uint _reward) internal {
        for (uint i = 0; i < 8; i++) {
            uint key = _season * 1000 + i;
            Fighter storage item = soldiers[key];
            address owner = item.owner;
            uint fund = safeDiv(_reward, 10);
            if (i == _winner) {
                fund = safeMul(fund, 3);
            }
            if (owner == address(0)) {
                _addMoney(cfoAddress, fund);
            } else {
                _addMoney(owner, fund);
            }
        }
    }
}