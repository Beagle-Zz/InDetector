contract c13335{
    //get all addresses that has been airdropped
    function getDoneAddresses() public constant returns (address[]){
        return airdropDoneList;
    }
}