contract c40191{
     
    function setConfig(string _key, uint256 _value) onlyOwner {
        chainyConfig[_key] = _value;
    }
}