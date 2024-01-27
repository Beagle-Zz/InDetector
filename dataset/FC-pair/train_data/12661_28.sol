contract c12661{
    // ERC777 tokens receiver callback
    function tokensReceived(address operator, address from, address to, uint amount, bytes userData, bytes operatorData) external {
        require(msg.sender == address(token));
        debt = (debt >= amount ? debt.sub(amount) : 0);
        emit ReceivedTokens(operator, from, to, amount, userData, operatorData);
    }
}