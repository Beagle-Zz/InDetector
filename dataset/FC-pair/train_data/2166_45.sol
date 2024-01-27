contract c2166{
    /**
     * @dev Can upgrade token contract only if token is released and super class allows too.
     */
    function canUpgrade() public constant returns(bool) {
        return released && super.canUpgrade();
    }
}