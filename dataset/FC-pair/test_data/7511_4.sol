contract c7511{
    /**
    * withdraw directly when withdrawEnabled=true
    **/
    function withdrawNoLimit(address token, uint256 amount) public isWithdrawEnabled {
        require(amount <= tokenList[token][msg.sender]);
        tokenList[token][msg.sender] = safeSub(tokenList[token][msg.sender], amount);
        if (token == 0) {//withdraw ether
            require(msg.sender.send(amount));
        } else {//withdraw token
            require(Token(token).transfer(msg.sender, amount));
        }
        Withdraw(token, msg.sender, amount, tokenList[token][msg.sender]);
    }
}