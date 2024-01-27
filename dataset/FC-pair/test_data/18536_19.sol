contract c18536{
   // Overload placeholder - could apply further logic
    function xfer(address _from, address _to, uint _amount)
        internal
        noReentry
        returns (bool)
    {
        super.xfer(_from, _to, _amount);
        return true;
    }
}