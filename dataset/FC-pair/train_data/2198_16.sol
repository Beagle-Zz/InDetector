contract c2198{
    /**
    * get the option os the player choosed
    **/
    function getPlayerOption() public view returns (uint) {
        if (option1List[msg.sender]) {
            return 1;
        } else if (option2List[msg.sender]) {
            return 2;
        } else {
            return 0;
        }
    }
}