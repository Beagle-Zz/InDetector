contract c16214{
    /* ### Moderator, Admin & Root Functions ### */
    // Moderator Flags
    function setPropertyFlag(uint16 propertyID, uint8 flag) public regulatorAccess(flag == FLAG_NSFW ? LEVEL_1_MODERATOR : LEVEL_2_MODERATOR) {
        properties[propertyID].flag = flag;
        if (flag == FLAG_BAN) {
            require(properties[propertyID].isInPrivateMode); //Can't ban an owner's property if a public user caused the NSFW content
            properties[propertyID].colors = [0, 0, 0, 0, 0];
        }
    }
}