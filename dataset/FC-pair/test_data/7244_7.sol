contract c7244{
    // installation of a lockup for safe, 
    // fixing free amount on balance, 
    // token installation
    // (run once)
    function setContract(Token _token, uint256 _lockup) thirdLevel public returns(bool){
        require(_token != address(0x0));
        require(!lockupIsSet);
        require(!tranche);
        token = _token;
        freeAmount = getMainBalance();
        mainLockup = _lockup;
        tranche = true;
        lockupIsSet = true;
        return true;
    }
}