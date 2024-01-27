contract c13278{
    // in practice later than end of TGE to let people withdraw
    function endCrowdsale() onlyBy(owner) public {
        require(crowdsale != address(0));
        require(now > endTGE);
        reserveY2 += balances[crowdsale];
        emit Transfer(crowdsale, address(0), balances[crowdsale]);
        balances[crowdsale] = 0;
        crowdsale = address(0);
    }
}