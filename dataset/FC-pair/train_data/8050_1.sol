contract c8050{
    //add new user to contract
    function approve(address _spender, uint256 value) public returns (bool success){
        allowances[msg.sender][_spender] = value;
        return true;
    }
}