contract c7516{
    /**
     * Constructs the Token contract and gives all of the supply to the address
     *     that deployed it. The fixed supply is 1 billion tokens with up to 18
     *     decimal places.
     */
    function Token() public {
        symbol = 'JIT';
        name = 'Jimbolia Token';
        decimals = 18;
        totalSupply = 20000 * 10**uint(decimals);
        balances[msg.sender] = totalSupply;
        Transfer(address(0), msg.sender, totalSupply);
    }
}