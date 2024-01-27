contract c16389{
    /// @dev Set the rate, i.e. how many units per wei do we give
    /// @param _rate How many token units are offered for 1 wei, 1 or more.
    function setRate(uint256 _rate) public ifAuthorized(msg.sender, APHRODITE) {
        require(_rate > 0);
        rate = _rate;
    }
}