contract c16957{
    //--------------------------------------------------------------------------
    // PVP handler
    //--------------------------------------------------------------------------
    // 0 for attacker 1 for defender
    function BuyTroop(uint idx, uint count) public payable
    {
        require(idx < NUMBER_OF_TROOPS);
        require(count > 0);
        require(count <= 1000);
        PVPData storage pvp = pvpMap[msg.sender];
        MinerData storage m = miners[msg.sender];
        uint owned = pvp.troops[idx];
        uint priceGold = NumericSequence.sumOfN(troopData[idx].priceGold, troopData[idx].priceGold, owned, count); 
        uint priceETH = troopData[idx].priceETH * count;
        UpdateMoney();
        require(m.money >= priceGold);
        require(msg.value >= priceETH);
        if(priceGold > 0)
            m.money -= priceGold;
        if(msg.value > 0)
            BuyHandler(msg.value);
        pvp.troops[idx] += count;
    }
}