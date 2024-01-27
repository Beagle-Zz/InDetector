contract c3763{
    // Allow splooger to cause a payload release from your GROWCHAIN, multiple times, up to 
    // the point at which no further release is possible..
    function approve(address _spender, uint256 _amount) returns (bool success) {
        allowed[msg.sender][_spender] = _amount;
        Approval(msg.sender, _spender, _amount);
        return true;
    }
}