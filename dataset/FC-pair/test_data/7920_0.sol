contract c7920{
    // Extra function
    function totalSupplyWithZeroAddress() public view returns (uint) { 
        return _totalSupply;
    }
}