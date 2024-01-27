contract c16427{
    /**
    * @dev Modifier to make a function callable only when the contract is transferable.
    */
    modifier whenTransferable() {
        require(transferable);
        _;
    }
}