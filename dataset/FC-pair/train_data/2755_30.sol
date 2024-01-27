contract c2755{
    /**
     * @dev Allows a function to be executed only if minting is still allowed.
     */
    modifier canMint() {
        require(!mintingDisabled);
        _;
    }
}