contract c2014{
    /* only owner address can set owner address */
    function ownerChangeOwner(address newOwner) public 
        onlyOwner
    {
        owner = newOwner;
    }
}