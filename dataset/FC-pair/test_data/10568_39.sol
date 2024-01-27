contract c10568{
    /*
     *  @dev function that enables to add one-off additional text to the token
     *  @param uint256 tokenID of the token an owner wants to add dedication text to
     *  @param string wording of the dedication to be shown with the flower
     */
    function addDedication(uint256 tokenID, string wording)
    onlyOwnerOf(tokenID)
    public {
        require(bytes(dedication[tokenID]).length == 0);
        dedication[tokenID] = wording;
        emit FlowerDedicated(tokenID, wording);
    }
}