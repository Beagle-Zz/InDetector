contract c16434{
    // Lock the shares so contract owners cannot change them
    function lockShares() public onlyOwner() {
        require(!locked);
        locked = true;
    }
}