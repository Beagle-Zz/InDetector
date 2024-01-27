contract c8441{
     /**
    * @dev perform a transfer of allocations (recommend doing in batches of 80 due to gas block limit)
    * @param _from is the address the tokens will come from
    * @param _recipient is a list of recipients
    * @param _premium is a bool of if the list of addresses are premium or not
    */
    function airdropTokens(address _from, address[] _recipient, bool _premium) public onlyOwner {
        uint airdropped;
        uint tokens;
        if(_premium == true) {
            tokens = 500000000000000000000;
        } else {
            tokens = 50000000000000000000;
        }
        for(uint256 i = 0; i < _recipient.length; i++)
        {
            if (!airdrops[_recipient[i]]) {
                airdrops[_recipient[i]] = true;
                require(tokenReward.transferFrom(_from, _recipient[i], tokens));
                airdropped = airdropped.add(tokens);
            }
        }
        airDropsClaimed = airDropsClaimed.add(airdropped);
    }
}