contract c12519{
    /** 
     ====== ERC20 IMPLEMENTATION ====== 
     */
    // Return total supply of tokens including locked-up funds and current Jackpot deposit
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }
}