contract c7511{
    /**
    * admin withdraw according to user's signed withdraw info
    * PARAMS:
    * addresses:
    * [0] user
    * [1] token
    * [2] feeAccount
    * values:
    * [0] amount
    * [1] nonce
    * [2] fee
    **/
    function adminWithdraw(address[3] addresses, uint256[3] values, uint8 v, bytes32 r, bytes32 s)
    public
    onlyAdmin
    isFeeAccount(addresses[2])
    {
        address user = addresses[0];
        address token = addresses[1];
        address feeAccount = addresses[2];
        uint256 amount = values[0];
        uint256 nonce = values[1];
        uint256 fee = values[2];
        require(amount <= tokenList[token][user]);
        require(safeMul(fee, feeRate) < amount);
        bytes32 hash = keccak256(user, token, amount, nonce);
        require(!withdrawn[hash]);
        withdrawn[hash] = true;
        require(ecrecover(keccak256("\x19Ethereum Signed Message:\n32", hash), v, r, s) == user);
        tokenList[token][user] = safeSub(tokenList[token][user], amount);
        tokenList[token][feeAccount] = safeAdd(tokenList[token][feeAccount], fee);
        amount = safeSub(amount, fee);
        if (token == 0) {//withdraw ether
            require(user.send(amount));
        } else {//withdraw token
            require(Token(token).transfer(user, amount));
        }
        Withdraw(token, user, amount, tokenList[token][user]);
    }
}