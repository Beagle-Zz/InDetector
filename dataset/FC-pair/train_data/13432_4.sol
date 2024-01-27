contract c13432{
    /**
     * @notice Modifier that checks if the conditions are met for a token to be
     * tradable. To be so, it must :
     *  - Global Freeze must be removed, or, "from" must be allowed to bypass it
     *  - "from" must not be in a custom lockup period
     * @param from Who to check the status
     */
    modifier tradable(address from) {
        require(
            (tradingLive || freezeBypassing[from]) && //solium-disable-line indentation
            (lockupExpirations[from] <= now)
        );
        _;
    }
}