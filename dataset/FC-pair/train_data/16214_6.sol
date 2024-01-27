contract c16214{
    /* ### All Getters/Views ### */
    function getOwnerHoverText(address user) public view returns(uint256[2]) {
        return ownerHoverText[user];
    }
}