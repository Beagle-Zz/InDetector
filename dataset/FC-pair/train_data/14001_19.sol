contract c14001{
    /**
        @dev disables/enables token transfers
        can only be called by the contract owner
        @param _disable    true to disable transfers, false to enable them
    */
    function disableTokenTransfers(bool _disable) public ownerOnly {
        token.disableTransfers(_disable);
    }
}