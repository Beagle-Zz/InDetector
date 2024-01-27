contract c4761{
    // pause once cards become tradable
    function claimPheonix(address user) public returns (bool){
        require(isApproved(msg.sender));
        if (claimed[user] || paused){
            return false;
        }
        claimed[user] = true;
        core.createCard(user, PHEONIX_PROTO, 0);
        return true;
    }
}