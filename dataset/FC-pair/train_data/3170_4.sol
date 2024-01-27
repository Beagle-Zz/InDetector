contract c3170{
    /**
     *  updateUserClaimInBulk updates multiple users claim status and adds token to their wallet
     */
    function updateUserClaimInBulk(address[] _userAddresses, uint256[] _tokens)
        external onlyOwner returns (bool)
    {
        require(_userAddresses.length == _tokens.length);
        for (uint16 i = 0; i < _userAddresses.length; i++) {
            claimedTokens[_userAddresses[i]] = claimedTokens[_userAddresses[i]] + _tokens[i];
            emit UpdatedClaim(_userAddresses[i], _tokens[i], false);
        }
        return true;
    }
}