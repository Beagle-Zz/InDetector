contract c16802{
    /**
     * Returns current asset implementation contract address.
     *
     * @return asset implementation contract address.
     */
    function getLatestVersion() constant returns(address) {
        return latestVersion;
    }
}