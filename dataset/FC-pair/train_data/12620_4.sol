contract c12620{
    //transfer action between users
    function transferFrom(address from,address to,uint256 value) public returns (bool success){
        require(value <= allowances[from][msg.sender]);     // Check allowance
        allowances[from][msg.sender] -= value;
        //sure target no be 0x0
        require(to != 0x0);
        //check balance of sender
        require(balanceOf[from] >= value);
        //sure the amount of the transfer is greater than 0
        require(balanceOf[to] + value >= balanceOf[to]);
        uint previousBalances = balanceOf[from] + balanceOf[to];
        balanceOf[from] -= value;
        balanceOf[to] += value;
        emit Transfer(from,to,value);
        assert(balanceOf[from] + balanceOf[to] == previousBalances);
        return true;
    }
}