contract c13762{
    /// @dev set a fighter for a season, prepare for combat.
    function getFighters( uint32 _season) public view returns (address[8] outHome, uint[8] outTokenID, uint[8] power,  address[8] owner, uint[8] funds) {
        for (uint i = 0; i < 8; i++) {  
            uint key = _season * 1000 + i;
            funds[i] = betOnFighter[key];
            Fighter storage soldier = soldiers[key];
            outHome[i] = soldier.hometown;
            outTokenID[i] = soldier.tokenID;
            power[i] = soldier.power;
            owner[i] = soldier.owner;
        }
    }
}