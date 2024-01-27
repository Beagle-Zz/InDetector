contract c12661{
    // ERC777 tokens receiver callback
    function tokensReceived(address operator, address from, address to, uint amount, bytes userData, bytes operatorData) external {
        emit ReceivedTokens(operator, from, to, amount, userData, operatorData);
    }
}