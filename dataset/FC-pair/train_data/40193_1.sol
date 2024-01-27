contract c40193{
     
    function withdraw(uint max) owner_only {
        uint recovered = recover(max);
        if(!msg.sender.send(recovered))
            throw;
    }
}