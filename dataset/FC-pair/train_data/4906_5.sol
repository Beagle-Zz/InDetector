contract c4906{
    /**
     * Only current asset owner is allowed to call.
     */
    modifier onlyAssetOwner() {
        if (platform.isOwner(msg.sender, smbl)) {
            _;
        }
    }
}