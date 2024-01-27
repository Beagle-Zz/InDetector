contract c18749{
    // check fund controls before forwarding call to standard token allowance spending function
    function transferFrom(address _from, address _to,
                          uint256 _amount) public returns (bool success) {
        require(!fundManagers[_from]);
        require(!fundManagers[_to]);
        return super.transferFrom(_from, _to, _amount);
    }
}