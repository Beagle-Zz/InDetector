contract c40251{
     
    function WithDraw() OnlyOwner returns(bool){
        if(this.balance > 0 && Owner.send(this.balance)){
            return true;
        }
        throw;
    }
}