contract c7261{
    //-------------------------------------------------------------------------- @dev Allows the current owner to transfer control of the contract to a newOwner.
    function transferOwnership(address newOwner) public onlyOwner               // @param newOwner The address to transfer ownership to.
    {
        require(newOwner != address(0));
        owner = newOwner;
        allowedSender = newOwner;
    }
}