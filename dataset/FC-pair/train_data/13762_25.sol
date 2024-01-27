contract c13762{
    /// @dev nobody win, return fund back to all bettors.
    function backToAll(uint32 _season) internal {
        for (uint i = 0; i < 8; i++) {
            uint key = _season * 1000 + i;
            Betting[] storage items = allBittings[key];
            for (uint j = 0; j < items.length; j++) {
                Betting storage item = items[j];
                address account = item.account;
                uint backVal = safeDiv(safeMul(item.amount, 8), 10); // amount * 0.8
                _addMoney(account, backVal);
            }
        }
    }
}