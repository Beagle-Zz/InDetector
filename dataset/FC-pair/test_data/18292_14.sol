contract c18292{
    /**
    * @dev Throws if called by any account other than the owner.
    */
    modifier onlyOwnerContract() {
        require(msg.sender == ownerContract);
        _;
    }
}