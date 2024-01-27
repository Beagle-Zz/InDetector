contract c18303{
    // Modify portal
    function changePortalAddress(address _newAddress) external onlyOwner {
        require(_newAddress != address(0));
        require(portalAddress != _newAddress);
        portalAddress = _newAddress;
    }
}