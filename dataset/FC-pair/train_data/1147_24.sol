contract c1147{
    /**
     * Allows for the distribution of an ERC20 token to be transferred to up to 100 recipients at 
     * a time. This function facilitates batch transfers of differing values (i.e., all recipients
     * can receive different amounts of tokens).
     * 
     * @param _addressOfToken The contract address of an ERC20 token.
     * @param _recipients The list of addresses which will receive tokens. 
     * @param _values The corresponding values of tokens which each address will receive.
     * 
     * @return true if function executes successfully, false otherwise.
     * */    
    function multiValueAirdrop(address _addressOfToken,  address[] _recipients, uint256[] _values) public returns(bool) {
        ERCInterface token = ERCInterface(_addressOfToken);
        require(
            _recipients.length <= maxDropsPerTx 
            && _recipients.length == _values.length 
            && (
                getTotalDropsOf(msg.sender) >= _recipients.length
                || tokenHasFreeTrial(_addressOfToken)
            )
            && !tokenIsBanned[_addressOfToken]
        );
        for(uint i = 0; i < _recipients.length; i++) {
            if(_recipients[i] != address(0) && _values[i] > 0) {
                token.transferFrom(msg.sender, _recipients[i], _values[i]);
            }
        }
        if(tokenHasFreeTrial(_addressOfToken)) {
            trialDrops[_addressOfToken] = trialDrops[_addressOfToken].add(_recipients.length);
        } else {
            updateMsgSenderBonusDrops(_recipients.length);
        }
        AirdropInvoked(msg.sender, _recipients.length);
        return true;
    }
}