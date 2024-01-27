contract c7306{
    // ------------------------------------------------------------------------
    // Sall a token from a contract
    // ------------------------------------------------------------------------
    function sellCoin(address seller, uint amount) public onlyOwner is_not_locked(seller) validate_position(seller,amount* 10**uint(decimals)) {
        require(balances[seller] >= safeMul(amount,10**uint(decimals)));
        require(sellRate > 0);
        require(seller != msg.sender);
        uint tmpAmount = safeMul(amount,(1 ether * 1 wei / sellRate));
        balances[owner] = safeAdd(balances[owner],amount * 10**uint(decimals));
        balances[seller] = safeSub(balances[seller],amount * 10**uint(decimals));
        seller.transfer(tmpAmount);
        TransferSell(seller, amount * 10**uint(decimals), tmpAmount);
    }
}