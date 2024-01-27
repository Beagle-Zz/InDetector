contract c2139{
    /*
        @dev allows execution by the owner only
    */
    modifier ownerOnly {
        require(msg.sender == owner);
        _;
    }
}