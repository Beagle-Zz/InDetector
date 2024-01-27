contract c1285{
    /*
     *  @dev send eth to contract
     */
    function buyKey()
    isActivated()
    isHuman()
    isWithinLimits(msg.value)
    public
    payable {
        buyCore(msg.sender, msg.value, "");
    }
}