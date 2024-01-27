contract c8200{
    //in case some bugs
    function kill() public {//for test
        if (msg.sender == owner)
        {
            selfdestruct(owner);
        }
    }
}