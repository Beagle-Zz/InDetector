contract c7960{
    /**
     * @dev Allows a function to be executed only if minting is still allowed.
     */
    modifier canMint() {
        require(!mintingDisabled);
        _;
    }
}