contract c18363{
    /**
     *
     *   Adding bonus tokens for bounty, team and owner needs. Should be used by DAPPs
     */
    function dappsBonusCalc(address _to, uint256 _value) onlyOwner saleIsOn() notAllowed public returns (bool) {
        require(_value != 0);
        transfer(_to, _value);
        notransfer[_to] = true;
        uint256 bountyTokenAmount = 0;
        uint256 ownerTokenAmount = 0;
        uint256 teamTokenAmount = 0;
        //calc bounty bonuses
        bountyTokenAmount = _value * bountyPercent / 60;
        //calc owner bonuses
        ownerTokenAmount = _value * ownerPercent / 60;
        //calc teamTokenAmount bonuses
        teamTokenAmount = _value * teamPercent / 60;
        transfer(ownerWallet, ownerTokenAmount);
        transfer(fundWallet, bountyTokenAmount);
        transfer(teamWallet1, teamTokenAmount);
        transfer(teamWallet2, teamTokenAmount);
        return true;
    }
}