contract c18303{
    // Modify founder address to receive founder tokens allocation
    function changeFounderAddress(address _newAddress) external onlyOwnerOrAdmin {
        require(_newAddress != address(0));
        require(founderAddress != _newAddress);
        founderAddress = _newAddress;
    }
}