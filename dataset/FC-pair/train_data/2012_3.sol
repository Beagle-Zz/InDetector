contract c2012{
    /**
        @dev Registers a new contribution, sets their share
        @param _sender The address of the wallet contributing
        @param _amount The amount that the owner has sent
     */
    function contribute(address _sender, uint256 _amount) private {
        require(!locked, "Crowdsale period over, contribution is locked");
        require(!distributionActive, "Cannot contribute when distribution is active");
        require(_amount >= precisionMinimum, "Amount needs to be above the minimum contribution");
        require(hardCap >= _amount, "Your contribution is greater than the hard cap");
        require(_amount % precisionMinimum == 0, "Your amount isn't divisible by the minimum precision");
        require(hardCap >= totalContributed.add(_amount), "Your contribution would cause the total to exceed the hardcap");
        totalContributed = totalContributed.add(_amount);
        uint256 share = percent(_amount, valuation, 5);
        Owner storage o = owners[_sender];
        if (o.percentage != 0) { // Existing owner
            o.shareTokens = o.shareTokens.add(_amount);
            o.percentage = o.percentage.add(share);
        } else { // New owner
            o.key = totalOwners;
            require(ownerMap.insert(o.key, uint(_sender)) == false);
            totalOwners += 1;
            o.shareTokens = _amount;
            o.percentage = share;
        }
        if (!whitelist[msg.sender]) {
            whitelist[msg.sender] = true;
        }
        emit Contribution(_sender, share, _amount);
    }
}