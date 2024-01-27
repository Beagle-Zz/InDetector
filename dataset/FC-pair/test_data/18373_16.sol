contract c18373{
    /// @dev allocate token for contributors Address
    function allocateAngelWheelFinanceToken(address[] _angelWheelFinancingAddress, uint256[] _amount) public onlyOwner {
        //require(balances[contributorsAddress] == 0);
        angelWheelFinancing = mintMultiToken(_angelWheelFinancingAddress, _amount, angelWheelFinancing);
        require (angelWheelFinancing <= angelWheelFinanceSupply);
    }
}