contract c16802{
    /**
     * Returns proposed next asset implementation contract address.
     *
     * @return asset implementation contract address.
     */
    function getPendingVersion() constant returns(address) {
        return pendingVersion;
    }
}