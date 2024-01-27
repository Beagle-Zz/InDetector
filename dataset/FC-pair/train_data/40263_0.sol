contract c40263{
     
    modifier OnlyOwner(){
        if(msg.sender != Owner){
            throw;
        }
        _;
    }
}