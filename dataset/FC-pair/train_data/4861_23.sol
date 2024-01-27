contract c4861{
    /**
     * Returns asset implementation contract for current caller.
     *
     * @return asset implementation contract.
     */
    function _getAsset() internal view returns (ATxAssetInterface) {
        return ATxAssetInterface(getLatestVersion());
    }
}