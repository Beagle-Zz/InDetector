contract c7244{
    // withdrawal tokens from safe for issuer
    function AssetWithdraw(address _to, uint256 _balance) secondLevel public returns(bool){
        require(_balance<=freeAmount);
        require(now>=mainLockup);
        freeAmount = freeAmount.sub(_balance);
        token.transfer(_to, _balance);
        emit Withdraw(this, _balance);
        return true;
    }
}