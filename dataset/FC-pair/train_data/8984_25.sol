contract c8984{
    //End Authority and control
    //data migration
    function migration(address addr) public {
        if (logic.migration(msg.sender, addr) == true) {
            emit Transfer(msg.sender, addr,logic.getOldBalanceOf(addr));
        }
    }
}