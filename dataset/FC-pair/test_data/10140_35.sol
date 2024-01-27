contract c10140{
    /**
     * @dev Parameter can be used only once
     * @param _hash Single usage hash
     */
    function usedHashGuard(bytes32 _hash) internal {
        require(!usedHash[_hash]);
        usedHash[_hash] = true;
    }
}