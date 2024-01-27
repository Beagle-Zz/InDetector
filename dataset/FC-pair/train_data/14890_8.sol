contract c14890{
    // should be called by JoysoCrowdSale when crowdSale is finished
    function unlock() onlyOwner {
        isLocked = false;
    }
}