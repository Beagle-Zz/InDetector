contract c10096{
    /**
     * Returns asset implementation contract for current caller.
     *
     * @return asset implementation contract.
     */
    function _getAsset() internal returns(AssetInterface) {
        return AssetInterface(getVersionFor(msg.sender));
    }
}