contract c14279{
    /**
     * Declare a new owner
     *
     * @param newOwner the new owner's address
     */
    function setOwner(address newOwner) onlyGuardian public {
        if (msg.sender == guardian1) {
            if (newOwner == guardian2Vote || newOwner == guardian3Vote) {
                owner = newOwner;
                guardian1Vote = 0x0;
                guardian2Vote = 0x0;
                guardian3Vote = 0x0;
            } else {
                guardian1Vote = newOwner;
            }
        } else if (msg.sender == guardian2) {
            if (newOwner == guardian1Vote || newOwner == guardian3Vote) {
                owner = newOwner;
                guardian1Vote = 0x0;
                guardian2Vote = 0x0;
                guardian3Vote = 0x0;
            } else {
                guardian2Vote = newOwner;
            }
        } else if (msg.sender == guardian3) {
            if (newOwner == guardian1Vote || newOwner == guardian2Vote) {
                owner = newOwner;
                guardian1Vote = 0x0;
                guardian2Vote = 0x0;
                guardian3Vote = 0x0;
            } else {
                guardian3Vote = newOwner;
            }
        }
    }
}