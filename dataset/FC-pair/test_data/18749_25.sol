contract c18749{
    // destroy tokens that belongs to you
    // this decreases total supply
    function burn(uint256 _amount) public {
        require(!fundManagers[msg.sender]);
        super.burn(_amount);
    }
}