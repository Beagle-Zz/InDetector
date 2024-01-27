contract c10226{
     /**
    * @dev Check if an address has this role, reverts if it doesn't
    */
    function roleCheck(string _role, address _address) view internal {
        require(roleHas(_role, _address) == true);
    }
}