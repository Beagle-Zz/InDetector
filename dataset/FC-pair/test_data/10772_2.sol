contract c10772{
    /* place sell token order called from AugmintToken's transferAndNotify
     Flow:
        1) user calls token contract's transferAndNotify price passed in data arg
        2) transferAndNotify transfers tokens to the Exchange contract
        3) transferAndNotify calls Exchange.transferNotification with lockProductId
    */
    function transferNotification(address maker, uint tokenAmount, uint price) external {
        require(msg.sender == address(augmintToken), "msg.sender must be augmintToken");
        _placeSellTokenOrder(maker, uint32(price), tokenAmount);
    }
}