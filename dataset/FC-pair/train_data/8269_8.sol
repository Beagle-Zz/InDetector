contract c8269{
    // @notice Sell `amount` tokens to contract
    function sell(uint256 amount) public {
        require(now > 1543536000); // seconds since 01.01.1970 to 30.11.2018 (18:00:00 o'clock GMT) 
        require(amount > 0);
        require(balances[msg.sender] >= amount);
        uint256 requiredBalance = amount.mul(sellPrice);
        require(this.balance >= requiredBalance);  // checks if the contract has enough ether to pay
        balances[msg.sender] -= amount;
        balances[owner] += amount;
        Transfer(msg.sender, owner, amount); 
        msg.sender.transfer(requiredBalance);    // sends ether to the seller.
    }
}