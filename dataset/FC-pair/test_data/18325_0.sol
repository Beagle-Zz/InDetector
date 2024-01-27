contract c18325{
    /**
    * @dev Throws if called by any account other than the owner.
    */
    modifier ownerOnly()
    {
        require(msg.sender == owner);
        _;
    }
}