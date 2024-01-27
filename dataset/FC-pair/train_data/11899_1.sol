contract c11899{
    /*Claim a token for an article */
    function claimReadership(uint256 articleNum, string key) {
        if (shieldsUp && !proofOfSms.certified(msg.sender)) {
            ClaimResult(1); //missing sms certification
             throw;
        } else if (readingRegister[msg.sender][articleNum]) {
            ClaimResult(2); // user alread claimed
            throw; 
        } else if (remainingTokensForArticle[publishedRegister[articleNum]] <= 0) {
            ClaimResult(3); //article out of tokens
            throw;
        } else if (keccak256(key) != articleKeyHashRegister[publishedRegister[articleNum]]) {
            ClaimResult(4); //incorrect key
            throw; 
        } else if (balanceOf[msg.sender] + 1 < balanceOf[msg.sender]) {
            ClaimResult(5); //overflow error
            throw;
        } 
        remainingTokensForArticle[publishedRegister[articleNum]]--;
        totalSupply++;
        readingRegister[msg.sender][articleNum] = true;
        balanceOf[msg.sender] += 1;
        ClaimResult(0);
    }
}