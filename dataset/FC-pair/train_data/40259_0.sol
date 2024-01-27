contract c40259{
     
    modifier OnlyOwner(){
        if(msg.sender != Owner){
            throw;
        }
        _;
    }
}