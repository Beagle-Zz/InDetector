contract c3457{
    /**
     * @dev check whether can tranfer tokens or not.
     */
    modifier isTokenTransfer {
        if(!tokenTransfer) {
            require(unlockAddress[msg.sender]);
        }
        _;
    }
}