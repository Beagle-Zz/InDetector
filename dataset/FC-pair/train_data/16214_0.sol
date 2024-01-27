contract c16214{
    /* ### Regulation Access Modifiers ### */
    modifier regulatorAccess(uint8 accessLevel) {
        require(accessLevel <= LEVEL_3_ROOT); // Only request moderator, admin or root levels forr regulatorAccess
        require(regulators[msg.sender] >= accessLevel); // Users must meet requirement
        if (accessLevel >= LEVEL_1_ADMIN) { //
            require(regulators[msg.sender] <= LEVEL_3_ROOT); //DApps can't do Admin/Root stuff, but can set nsfw/ban flags
        }
        _;
    }
}