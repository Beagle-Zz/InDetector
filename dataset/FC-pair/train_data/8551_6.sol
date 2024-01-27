contract c8551{
    /**
    * @dev Throws if called by any account other than the owner.
    */
    modifier onlyOwner() {
        if (msg.sender != owner) {
            throw;
        }
        _;
    }
}