contract c40120{
     
    function withdrawAsset(uint256 _value) onlyOwner returns (bool ok)
    {
        return ERC20(asset).transfer(owner,_value);
        UpdateEvent();
    }
}