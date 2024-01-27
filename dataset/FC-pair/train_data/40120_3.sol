contract c40120{
     
     
    function withdrawToken(address _token, uint256 _value) onlyOwner returns (bool ok)
    {
        return ERC20(_token).transfer(owner,_value);
        UpdateEvent();
    }
}