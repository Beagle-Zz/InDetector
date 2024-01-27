contract c18625{
    /**
     * init parter
     */
    function setParter(address _parter, uint256 _amount) public onlyOwner {
        //require(_amount == 210000);
        require(parterAcc.length <= 49);
        parterAcc.push(_parter);
        frozenBalances[_parter] = _amount;
        SetParter(_parter, _amount);
    }
}