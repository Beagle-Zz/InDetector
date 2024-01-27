contract c7941{
    /**
    * @dev Throws if called by any account other than the validator.
    */
    modifier onlyValidator() {
        require(msg.sender == validator);
        _;
    }
}