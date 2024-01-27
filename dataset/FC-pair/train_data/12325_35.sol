contract c12325{
    // change minimum nac to deposit
    function changeMinNac(uint _minNAC) public
        onlyEscrow
    {
        require(_minNAC != 0);
        minNac = _minNAC;
    }
}