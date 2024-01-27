contract c2365{
    // should be called by crowdSale when crowdSale is finished
    function unlock() onlyOwner public{
        isLocked = false;
    }
}