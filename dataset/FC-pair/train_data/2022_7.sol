contract c2022{
    /**
        @dev Transfer part or all of your ownership to another address
        @param _receiver The address that you're sending to
        @param _amount The amount of ownership to send, for your balance refer to `ownerShareTokens`
     */
    function sendOwnership(address _receiver, uint256 _amount) public onlyWhitelisted() {
        Owner storage o = owners[msg.sender];
        Owner storage r = owners[_receiver];
        require(o.shareTokens > 0, "You don't have any ownership");
        require(o.shareTokens >= _amount, "The amount exceeds what you have");
        require(!distributionActive, "Distribution cannot be active when sending ownership");
        require(_amount % precisionMinimum == 0, "Your amount isn't divisible by the minimum precision amount");
        o.shareTokens = o.shareTokens.sub(_amount);
        if (o.shareTokens == 0) {
            o.percentage = 0;
            require(ownerMap.remove(o.key) == true);
        } else {
            o.percentage = percent(o.shareTokens, valuation, 5);
        }
        if (r.shareTokens == 0) {
            whitelist[_receiver] = true;
            require(ownerMap.insert(totalOwners, uint(_receiver)) == false);
            totalOwners += 1;
        }
        r.shareTokens = r.shareTokens.add(_amount);
        r.percentage = r.percentage.add(percent(_amount, valuation, 5));
        emit OwnershipTransferred(msg.sender, _receiver, _amount);
    }
}