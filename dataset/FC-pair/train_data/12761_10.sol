contract c12761{
    /**
     * @dev Modifier to make contract mint new tokens only
     *      - Staking has started.
     *      - When total supply has not reached MAX_TOTAL_SUPPLY.
     */
    modifier canMint() {
        require(stakeStartTime > 0 && now >= stakeStartTime && totalSupply_ < MAX_TOTAL_SUPPLY);            // solium-disable-line
        _;
    }
}