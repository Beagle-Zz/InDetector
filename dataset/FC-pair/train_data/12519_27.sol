contract c12519{
    // Function to check the amount of tokens than an owner allowed to a spender
    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        return allowed[_owner][_spender];
    }
}