contract c16214{
    // Setting moderator/admin/root access
    function setRegulatorAccessLevel(address user, uint8 accessLevel) public regulatorAccess(LEVEL_1_ADMIN) {
        if (msg.sender != user) {
            require(regulators[msg.sender] > regulators[user]); // You have to be a higher rank than the user you are changing
        }
        require(regulators[msg.sender] > accessLevel); // You have to be a higher rank than the role you are setting
        regulators[user] = accessLevel;
    }
}