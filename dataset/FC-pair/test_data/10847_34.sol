contract c10847{
	/// @dev Assigns a new address to act as the COO.
    /// @param _newCOO The address of the new COO.
    function setCOO(address _newCOO) external onlyOwner {
        require(_newCOO != address(0));
        cooAddress = _newCOO;
    }
}