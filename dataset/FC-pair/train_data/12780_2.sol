contract c12780{
    // Public functions
    function deposit() public payable { // Deposit Ethers
        tokens[0][msg.sender] = safeAdd(tokens[0][msg.sender], msg.value);
        emit Deposit(0, msg.sender, msg.value, tokens[0][msg.sender]);
    }
}