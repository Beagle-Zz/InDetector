contract c3044{
    /*
     * only called from within the this contract itself, will actually do the funding
     */
    function doFunding(bytes32 _platform, string _platformId, address _token, uint256 _value, address _funder) internal returns (bool success) {
        if (_token == ETHER_ADDRESS) {
            //must check this, so we don't have people foefeling with the amounts
            require(msg.value == _value);
        }
        require(!fundRepository.issueResolved(_platform, _platformId), "Can't fund tokens, platformId already claimed");
        for (uint idx = 0; idx < preconditions.length; idx++) {
            if (address(preconditions[idx]) != address(0)) {
                require(preconditions[idx].isValid(_platform, _platformId, _token, _value, _funder));
            }
        }
        require(_value > 0, "amount of tokens needs to be more than 0");
        if (_token != ETHER_ADDRESS) {
            require(ERC20(_token).transferFrom(_funder, address(this), _value), "Transfer of tokens to contract failed");
        }
        fundRepository.updateFunders(_funder, _platform, _platformId);
        fundRepository.updateBalances(_funder, _platform, _platformId, _token, _value);
        emit Funded(_funder, _platform, _platformId, _token, _value);
        return true;
    }
}