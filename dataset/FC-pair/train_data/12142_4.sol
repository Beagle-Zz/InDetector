contract c12142{
    /**
    * @dev This modifier limits function execution to the admin
    */
    modifier onlyAdmin(uint8 _level) { //A modifier to define admin-only functions
        require(admin[msg.sender] >= _level);
        _;
    }
}