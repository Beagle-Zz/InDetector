contract c8456{
    // mb deprecated
    function robotRefund(address investor) public onlyTeam ICOFailed
    {
        require(investor != 0x0);
        require(investors[investor] > 0);
        uint refundVal = investors[investor];
        investors[investor] = 0;
        uint balance = token.balanceOf(investor);
        totalSupply = totalSupply.sub(balance);
        investor.transfer(refundVal);
    }
}