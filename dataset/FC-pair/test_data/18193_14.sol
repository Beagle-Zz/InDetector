contract c18193{
    /**
    * @dev Throws if called by any account other than the owner.
    */
    modifier onlyOwnerContract() {
        require(msg.sender == ownerContract);
        _;
    }
}