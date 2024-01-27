contract c16357{
    /**
    * @dev Calculates the amount that has already vested but hasn't been released yet.
    */
    function releasableAmount() public view returns (uint256) {
        return vestedAmount().sub(released);
    }
}