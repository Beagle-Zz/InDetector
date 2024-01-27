contract c16427{
    /**
        MODIFIERS
    **/
    /**
    * @dev Modifier to make a function callable only when the contract is not transferable.
    */
    modifier whenNotTransferable() {
        require(!transferable);
        _;
    }
}