contract c7319{
    /// @dev notice, overrides previous implementation.
    function setDecimals(ERC20 token) internal {
        uint decimal;
        if (token == ETH_TOKEN_ADDRESS) {
            decimal = ETH_DECIMALS;
        } else {
            if (!address(token).call(bytes4(keccak256("decimals()")))) {/* solhint-disable-line avoid-low-level-calls */
                //above code can only be performed with low level call. otherwise all operation will revert.
                // call failed
                decimal = 18;
            } else {
                decimal = token.decimals();
            }
        }
        decimals[token] = decimal;
    }
}