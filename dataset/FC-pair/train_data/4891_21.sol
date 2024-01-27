contract c4891{
    /**
     * Returns current asset implementation contract address.
     *
     * @return asset implementation contract address.
     */
    function getLatestVersion() public view returns (address) {
        return latestVersion;
    }
}