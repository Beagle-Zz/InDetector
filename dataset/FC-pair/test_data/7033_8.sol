contract c7033{
    /// @dev returns number of reserves
    /// @return number of reserves
    function getNumReserves() public view returns(uint) {
        return reserves.length;
    }
}