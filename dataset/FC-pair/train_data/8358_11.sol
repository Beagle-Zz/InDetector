contract c8358{
    /**
     * @dev Revoke the grant of tokens of a specifed address.
     * @param _holder The address which will have its tokens revoked.
     * @param _grantId The id of the token grant.
     */
    function revokeTokenGrant(address _holder, uint _grantId) public returns (bool) {
        TokenGrant storage grant = grants[_holder][_grantId];
        if (!grant.revokable) { // Check if grant was revokable
            revert();
        }
        if (grant.granter != msg.sender) { // Only granter can revoke it
            revert();
        }
        address receiver = grant.burnsOnRevoke ? 0xdead : msg.sender;
        uint256 nonVested = nonVestedTokens(grant, now, block.number);
        // remove grant from array
        delete grants[_holder][_grantId];
        grants[_holder][_grantId] = grants[_holder][grants[_holder].length.sub(1)];
        grants[_holder].length -= 1;
        balances[receiver] = balances[receiver].add(nonVested);
        balances[_holder] = balances[_holder].sub(nonVested);
        emit Transfer(_holder, receiver, nonVested);
        return true;
    }
}