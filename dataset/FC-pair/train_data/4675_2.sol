contract c4675{
    /**
     * Only current asset owner is allowed to call.
     */
    modifier onlyAssetOwner() {
        if (etoken2.isOwner(msg.sender, etoken2Symbol)) {
            _;
        }
    }
}