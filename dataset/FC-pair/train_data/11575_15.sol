contract c11575{
    /// @notice calculates the SolidStamp commmission
    /// @param _amount amount to calcuate the commission from
    function calcCommission(uint _amount) private view returns(uint) {
        return _amount.mul(commission)/100; // service commision
    }
}