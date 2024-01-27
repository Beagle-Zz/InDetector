contract c7627{
    /**
        @notice Converts an amount to RCN using the loan oracle.
        @dev If the loan has no oracle the currency must be RCN so the rate is 1
        @return The result of the convertion
    */
    function convertRate(Oracle oracle, bytes32 currency, bytes data, uint256 amount) public returns (uint256) {
        if (oracle == address(0)) {
            return amount;
        } else {
            uint256 rate;
            uint256 decimals;
            (rate, decimals) = oracle.getRate(currency, data);
            require(decimals <= RCN_DECIMALS);
            return (safeMult(safeMult(amount, rate), (10**(RCN_DECIMALS-decimals)))) / PRECISION;
        }
    }
}