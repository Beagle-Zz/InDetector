contract c16319{
    /// owner must suspend delegate first before invoke kill method.
    function kill()
        onlyOwner
        isSuspended
        external
    {
        emit OwnershipTransferred(owner, 0x0);
        owner = 0x0;
    }
}