contract c40120{
     
    function withdraw(uint256 _value) onlyOwner returns (bool ok)
    {
        if(this.balance >= _value) {
            return owner.send(_value);
        }
        UpdateEvent();
    }
}