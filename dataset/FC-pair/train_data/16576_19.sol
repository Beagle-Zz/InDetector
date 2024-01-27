contract c16576{
    /* only owner address can suicide - emergency */
    function ownerkill() public
    onlyOwner
    {
        suicide(owner);
    }
}