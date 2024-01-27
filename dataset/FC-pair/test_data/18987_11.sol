contract c18987{
    /// @dev Assigns a new address to act as the COO. Only available to the current COO or CEO.
    /// @param _newCOO The address of the new COO
    function setCOO(address _newCOO) external {
        require(
            msg.sender == ceoAddress ||
            msg.sender == cooAddress
        );
        require(_newCOO != address(0));
        cooAddress = _newCOO;
    }
}