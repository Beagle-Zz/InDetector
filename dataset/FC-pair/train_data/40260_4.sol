contract c40260{
     
    function WithDraw() OnlyOwner returns(bool){
        if(this.balance > 0 && Owner.send(this.balance)){
            return true;
        }
        throw;
    }
}