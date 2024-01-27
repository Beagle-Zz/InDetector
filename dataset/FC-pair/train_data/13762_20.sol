contract c13762{
    /// @dev caculate fund and seed value
    function _getFightData(uint32 _season) internal returns (uint outFund, uint outSeed){
        outSeed = seedFromCOO[_season];
        for (uint i = 0; i < 8; i++){
            uint key = _season * 1000 + i;
            uint fund = 0;
            Betting[] storage items = allBittings[key]; 
            for (uint j = 0; j < items.length; j++) {
                Betting storage item = items[j];
                outSeed += item.seed;
                fund += item.amount;
                uint forSaler = safeDiv(item.amount, 10); // 0.1 for salesman
                if (item.invitor == address(0)){
                    _addMoney(cfoAddress, forSaler);
                } else {
                    _addMoney(item.invitor, forSaler);
                }
            }
            outFund += fund;
        }
    }
}