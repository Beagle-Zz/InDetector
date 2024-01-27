contract c16129{
    /// @notice Buy tokens from contract by sending ether
    function buy() payable public {
        uint amount = msg.value / tokenPrice;
        require (totalSupply >= amount);
        require(!frozenAccount[msg.sender]);
        totalSupply -= amount;
        balanceOf[msg.sender] += amount;
        emit Transfer(address(0), msg.sender, amount);
    }
}