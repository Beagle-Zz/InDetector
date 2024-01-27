contract c16884{
        //can be called by crowdsale before token release, control over forSale portion of token supply
        function transferByCrowdsale(address to, uint256 value) public onlyCrowdsale {
          require(balances[forSale] >= value);
          balances[forSale] = balances[forSale].sub(value);
          balances[to] = balances[to].add(value);
          emit Transfer(forSale, to, value);
        }
}