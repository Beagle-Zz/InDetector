contract c137{
    /**
        @dev Called at the start of withdraw to distribute any pending balances that live in the contract
            will only ever be called if balance is non-zero (funds should be distributed)
    */
    function _updateDistribution() internal {
        require(toBeDistributed != 0,"nothing to distribute");
        uint256 knightPayday = toBeDistributed / 100 * knightEquity;
        uint256 paladinPayday = toBeDistributed / 100 * paladinEquity;
        /// @dev due to the equities distribution, queen gets the remaining value
        uint256 jokerPayday = toBeDistributed - knightPayday - paladinPayday;
        _cBalance[jokerAddress] = _cBalance[jokerAddress] + jokerPayday;
        _cBalance[knightAddress] = _cBalance[knightAddress] + knightPayday;
        _cBalance[paladinAddress] = _cBalance[paladinAddress] + paladinPayday;
        //Reset balance to 0
        toBeDistributed = 0;
    }
}