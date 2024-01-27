contract c7217{
    // Presale Priviledge Addresses methods: set, remove, is
    function addPrivilegeAddress(address _beneficiary) onlyOwner public {
        privilegeAddress[_beneficiary] = true;
    }
}