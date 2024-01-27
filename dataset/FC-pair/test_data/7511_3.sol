contract c7511{
    /**
    * user's withdraw will success in two cases:
    *    1. when the admin calls the approveWithdraw function;
    * or 2. when the lock time has passed since the application;
    **/
    function withdraw(address token, uint256 amount) public {
        require(amount <= tokenList[token][msg.sender]);
        if (amount > withdrawAllowance[token][msg.sender]) {
            //withdraw wait over time
            require(latestApply[token][msg.sender] != 0 && safeSub(block.timestamp, latestApply[token][msg.sender]) > applyWait);
            withdrawAllowance[token][msg.sender] = safeAdd(withdrawAllowance[token][msg.sender], applyList[token][msg.sender]);
            applyList[token][msg.sender] = 0;
        }
        require(amount <= withdrawAllowance[token][msg.sender]);
        withdrawAllowance[token][msg.sender] = safeSub(withdrawAllowance[token][msg.sender], amount);
        tokenList[token][msg.sender] = safeSub(tokenList[token][msg.sender], amount);
        latestApply[token][msg.sender] = 0;
        if (token == 0) {//withdraw ether
            require(msg.sender.send(amount));
        } else {//withdraw token
            require(Token(token).transfer(msg.sender, amount));
        }
        Withdraw(token, msg.sender, amount, tokenList[token][msg.sender]);
    }
}