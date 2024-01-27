contract c11069{
    // claim your MTU or Ether
    function ClaimMTU(bool claim) paused public {
        uint256 ethVal = Investors[msg.sender];
        require(ethVal >= claimRate);
        if (claim) {
            require(claimRate > 0);
            require(block.timestamp < ClaimingTimeLimit);
            ethRaised += ethVal;
            uint256 claimTokens = ethVal / claimRate;
            address tokenAddress = getAddress("unit");
            token tokenTransfer = token(tokenAddress);
            tokenTransfer.transfer(msg.sender, claimTokens);
            if (isCharged) {getAddress("team").transfer(ethVal / 20);}
        } else {
            msg.sender.transfer(ethVal);
        }
        Investors[msg.sender] -= ethVal;
        unClaimedEther -= ethVal;
    }
}