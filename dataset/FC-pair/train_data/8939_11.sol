contract c8939{
    /**
    * Function for transfer tokens from contract to any address
    *
    */
    function transferTokensFromContract(address _to, uint256 _value) public onlyOwner
    {
        avaliableSupply = avaliableSupply.sub(_value);
        _transfer(this, _to, _value);
    }
}