contract c4889{
    /**
     * Only current asset owner is allowed to call.
     */
    modifier onlyAssetOwner() {
        if (platform.isOwner(msg.sender, smbl)) {
            _;
        }
    }
}