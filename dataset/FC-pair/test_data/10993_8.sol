contract c10993{
    /**
     * modifier for some action only admin or owner can do
     */
    modifier onlyAdmins() {
        require(msg.sender == owner || admins[msg.sender]);
        _;
    }
}