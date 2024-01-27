contract c14742{
    /*
     * View
     */
    /// @notice Gets champ's attack power, defence power and cooldown reduction with items on
    function getChampStats(uint256 _champId) public view returns(uint256,uint256,uint256){
        Champ storage champ = champs[_champId];
        Item storage sword = items[champ.eq_sword];
        Item storage shield = items[champ.eq_shield];
        Item storage helmet = items[champ.eq_helmet];
        //AP
        uint256 totalAttackPower = champ.attackPower + sword.attackPower + shield.attackPower + helmet.attackPower; //Gets champs AP
        //DP
        uint256 totalDefencePower = champ.defencePower + sword.defencePower + shield.defencePower + helmet.defencePower; //Gets champs  DP
        //CR
        uint256 totalCooldownReduction = sword.cooldownReduction + shield.cooldownReduction + helmet.cooldownReduction; //Gets  CR
        return (totalAttackPower, totalDefencePower, totalCooldownReduction);
    }
}