contract c10369{
    //Claim tokens for final reserve wallet
    function claimTokenReserve() onlyTokenReserve locked public {
        address reserveWallet = msg.sender;
        // Can't claim before Lock ends
        require(block.timestamp > timeLocks[reserveWallet]);
        // Must Only claim once
        require(claimed[reserveWallet] == 0);
        uint256 amount = allocations[reserveWallet];
        claimed[reserveWallet] = amount;
        require(token.transfer(reserveWallet, amount));
        Distributed(reserveWallet, amount);
    }
}